// ignore_for_file: must_be_immutable

import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_field.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/bloc/forgot_password_bloc.dart';
import 'package:aunkur_farmer/src/service/api/base_client.dart';
import 'package:aunkur_farmer/src/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _newPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).forgotPassword)),

      body: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordFailureState) {
            // AppHelper.hideLoader();
            AppConstantUI.showCustomSnackBar(state.message, isError: true);
          } else if (state is ForgotPasswordSuccessState) {
            AppConstantUI.showCustomSnackBar(S.current.succesfull);

            AuthenticationRepository().logout();
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/LoginPage',
              (Route<dynamic> route) => false,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(scaffoldDefaultPadding),
            child: Column(
              children: [
                // const SizedBox(height: textfieldgap),
                StreamBuilder<String>(
                  stream: context
                      .read<ForgotPasswordBloc>()
                      .passwordStream,
                  builder: (context, snapshot) {
                    String? errorText = snapshot.error as String?;
                    return StreamBuilder<bool>(
                      stream: context.read<ForgotPasswordBloc>().isHideStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _passwordController,
                          obscureText: snapshot.data != null && snapshot.data!
                              ? false
                              : true,
                          labelText: S.of(context).currentPassword,
                          errorText: errorText,
                          prefixIcon: AppAssets.lock,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            context
                                .read<ForgotPasswordBloc>()
                                .updatePassword(value, context);
                            return;
                          },
                          hintText: '********',
                        );
                      },
                    );
                  },
                ),
                StreamBuilder<String>(
                  stream: context.read<ForgotPasswordBloc>().newPasswordStream,
                  builder: (context, snapshot) {
                    String? errorText = snapshot.error as String?;
                    return StreamBuilder<bool>(
                      stream: context.read<ForgotPasswordBloc>().isHideStream,
                      builder: (context, snapshot) {
                        return PrimaryTextField(
                          controller: _newPasswordController,
                          obscureText: snapshot.data != null && snapshot.data!
                              ? false
                              : true,
                          labelText: S.of(context).newPassword,
                          errorText: errorText,
                          prefixIcon: AppAssets.lock,
                          hintText: '********',
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            context.read<ForgotPasswordBloc>().updateNewPassword(
                              value,
                              context,
                            );
                            return;
                          },
                        );
                      },
                    );
                  },
                ),
                Spacer(),
                StreamBuilder<bool>(
                  stream: context.read<ForgotPasswordBloc>().isValidButton,
                  builder: (context, snapshot) {
                    bool isValid = snapshot.data ?? false;
                    return PrimaryButton(
                      title: S.of(context).save,
                      isLoading: state is ForgotPasswordLoadingState,
                      isEnable: isValid,
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        context.read<ForgotPasswordBloc>().add(
                          ForgotPasswordSubmitEvent(
                            password: _passwordController.text,
                            phone: preference.getString(AppConstant.PHONE),
                            newPassword: _newPasswordController.text,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
