// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/custom_checkbox_with_label.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_buttom.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_field.dart';
import 'package:aunkur_farmer/src/feature/authentication/bloc/auth_bloc.dart';
import 'package:aunkur_farmer/src/feature/language/bloc/language_bloc.dart';
import 'package:aunkur_farmer/src/feature/language/presentation/widget/language_selection_buttom_sheet.dart';
import 'package:aunkur_farmer/src/service/localStorage/locator_helper.dart';
import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final preferance = locatorHelper<SharedPreferencesHelper>();
  bool isOpen = false;

  bool isRememberMe = false;

  StreamController<bool> isVisiable = StreamController<bool>.broadcast();

  String language = 'en';

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    isVisiable.close();

    super.dispose();
  }

  @override
  void initState() {
    // _phoneController.text = "(+88) 01786-872-779";
    // _passwordController.text = "Hello@123";
    _phoneController.text = preferance.getString(AppConstant.PHONE);
    isRememberMe = preferance.getBool(AppConstant.REMEMBERME);
    debugPrint("====>>Phone: ${_phoneController.text}");
    debugPrint("====>>RememberMe: $isRememberMe");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: scaffoldDefaultPadding,
              ),
              child: TextButton.icon(
                onPressed: () {
                  languageSelectionButtonSheet(context, (value) {
                    context.read<LanguageBloc>().add(
                      ChangeLanguage(Locale(value)),
                    );
                    setState(() {
                      preferance.saveData(AppConstant.language, value);
                    });
                  }, preferance.getString(AppConstant.language));
                },
                label: Text(
                  CommonFunction.getLanguageTextByCode(
                    preferance.getString(AppConstant.language),
                  ),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                icon: SvgPicture.asset(
                  AppAssets.engimage,
                  width: 18,
                  height: 18,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black, // Text and icon color
                  side: const BorderSide(
                    color: AppColors.borderColor,
                  ), // Border color and width
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ), // Adjust padding if necessary
                ),
              ),
            ),
          ],
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              AppConstantUI.showCustomSnackBar(S.of(context).loginSuccess);

              preferance.saveData(AppConstant.REMEMBERME, isRememberMe);
              if (isRememberMe) {
                preferance.saveData(AppConstant.PHONE, _phoneController.text);
              } else {
                preferance.removeDataByKey(AppConstant.REMEMBERME);
                preferance.removeDataByKey(AppConstant.PHONE);
              }

              Navigator.of(context).pushNamedAndRemoveUntil(
                '/RootScreen',
                (Route<dynamic> route) => false,
                arguments: 0,
              );
            } else if (state is AuthFailure) {
              AppConstantUI.showCustomSnackBar(
                S.current.invalidLoginCredential,
                isError: true,
              );
            }
          },
          builder: (context, state) {
            // context.read<AuthBloc>().updatePhone(
            //   _phoneController.text,
            //   context,
            // );
            // context.read<AuthBloc>().updatePassword(
            //   _passwordController.text,
            //   context,
            // );
            return Padding(
              padding: const EdgeInsets.all(scaffoldDefaultPadding),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // const Spacer(),
                      // Image.asset(
                      //   AppAssets.appLogo,
                      //   height: SizeConfig.screenHeight * 0.15,
                      // ),
                      Text(
                        S.current.welcome,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      textLineGap.heightBox,
                      Text(
                        S.current.securerlyAccessYourAccount,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.07),
                      StreamBuilder<String>(
                        stream: context.read<AuthBloc>().phoneStream,
                        builder: (context, snapshot) {
                          return PrimaryTextField(
                            controller: _phoneController,
                            errorText: snapshot.error as String?,
                            inputFormatters: [
                              maskFormate,
                              LengthLimitingTextInputFormatter(19),
                            ],
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              context.read<AuthBloc>().updatePhone(
                                value,
                                context,
                              );
                              return;
                            },
                            hintText: "Ex : +880 1234 567 890",
                            labelText: S.of(context).mobileNumber,
                          );
                        },
                      ),
                      StreamBuilder<String>(
                        stream: context.read<AuthBloc>().passwordStream,
                        builder: (context, snapshot) {
                          return StreamBuilder<bool>(
                            stream: isVisiable.stream,
                            builder: (context, snap) {
                              return PrimaryTextField(
                                obscureText: snap.data ?? true,
                                controller: _passwordController,
                                errorText: snapshot.error as String?,
                                suffixIcon: snap.data ?? true
                                    ? AppAssets.invisibleIconSvg
                                    : AppAssets.visibleIconSvg,
                                onTapSuffixIcon: () {
                                  isVisiable.add(!(snap.data ?? false));
                                },
                                onChanged: (value) {
                                  context.read<AuthBloc>().updatePassword(
                                    value,
                                    context,
                                  );
                                  return;
                                },
                                hintText: "********",
                                labelText: S.of(context).password,
                              );
                            },
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabeledCheckbox(
                            label: S.current.saveMobileNumber,
                            value: isRememberMe,
                            onChanged: (value) {
                              setState(() {
                                isRememberMe = value;
                              });
                            },
                          ),
                          // PrimaryTextButtom(
                          //     title: "${S.current.forgotPassword}?",
                          //     onPressed: () {
                          //       Navigator.pushNamed(context, '/ForgotPassword');
                          //     }),
                        ],
                      ),
                      textfieldgap.heightBox,
                      StreamBuilder<bool>(
                        stream: context.read<AuthBloc>().signInButtonStream,
                        builder: (context, snapshot) {
                          return PrimaryButton(
                            title: S.of(context).signIn,
                            isEnable: snapshot.data ?? false,

                            isLoading: state is AuthLoading ? true : false,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              context.read<AuthBloc>().add(
                                AuthLoginRequestEvent(
                                  phone: _phoneController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                          );
                        },
                      ),

                      // const Spacer(),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryTextButtom(
                            title: "Create New Account",
                            onPressed: () {
                              Navigator.pushNamed(context, '/RegistrationPage');
                            },
                          ),
                          PrimaryTextButtom(
                            title: "Forgot Password?",
                            onPressed: () {
                              Navigator.pushNamed(context, '/ForgotPassword');
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.09),

                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).iPAGEGLOBALINC,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '${S.of(context).version} ${AppConstant.APP_VERSION}',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
