import 'dart:async';

import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_buttom.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  TextEditingController otpController = TextEditingController();

  final StreamController<bool> _validButtomStream =
      StreamController<bool>.broadcast();

  int _resendTimer = 5; // Resend timer duration in seconds

  late Timer _timer;

  @override
  void initState() {
    _resendOtp();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    errorController.close();
    _validButtomStream.close();
    otpController.dispose();
    super.dispose();
  }

  void _resendOtp() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_resendTimer == 0) {
        timer.cancel();
      } else {
        setState(() {
          _resendTimer--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Verification")),
      bottomNavigationBar: BottomAppBar(
        child: StreamBuilder<bool>(
          stream: _validButtomStream.stream,
          builder: (context, snapshot) {
            bool isValid = snapshot.data ?? false;
            return PrimaryButton(
              isEnable: isValid,
              title: "Verify",
              onTap: () {
                Navigator.pushReplacementNamed(context, '/NewPasswordPage');
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        child: SingleChildScrollView(
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
            listener: (context, state) {
              // TODO: implement listener
              if (state is ForgotPasswordOtpSentState) {
                AppConstantUI.showCustomSnackBar(S.current.succesfull);
              } else if (state is ForgotPasswordFailureState) {
                AppConstantUI.showCustomSnackBar(state.message, isError: true);
              } else if (state is ForgotPasswordOtpVerifiedState) {
                Navigator.pushReplacementNamed(context, '/NewPasswordPage');
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Lottie.asset(
                      AppAssets.otpLoti,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: textfieldgap * 2),
                  Text(
                    "Check your phone for the code sent to you",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  20.heightBox,
                  Form(
                    key: formKey,
                    child: PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      scrollPadding: EdgeInsets.zero,
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Color(0xffFF2501),
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,

                      /* obscuringWidget: const FlutterLogo(
                                      size: 24,
                                    ), */
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      autoFocus: false,

                      pinTheme: PinTheme(
                        fieldOuterPadding: EdgeInsets.zero,
                        inactiveColor: AppColors.lowWhite,
                        selectedColor: Colors.black,
                        selectedFillColor: Colors.white,
                        activeColor: Colors.white,
                        //disabledColor: Colors.black,
                        inactiveFillColor: Colors.white,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1,
                        fieldHeight: 55,
                        fieldWidth: 50,
                        errorBorderColor: Colors.black,
                        activeFillColor: AppColors.primaryGray,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      enablePinAutofill: false,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) async {
                        if (value.length == 4) {
                          _validButtomStream.sink.add(true);
                        } else {
                          _validButtomStream.sink.add(false);
                        }
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                  if (_resendTimer != 0) ...[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Send code again ${CommonFunction.formatSeconds(_resendTimer)} left',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ] else ...[
                    Align(
                      alignment: Alignment.topCenter,
                      child: PrimaryTextButtom(
                        title: "Resend code",
                        onPressed: () {
                          _resendTimer = 5;
                          _resendOtp();
                        },
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
