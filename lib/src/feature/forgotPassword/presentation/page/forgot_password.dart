import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/common_content.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/common/widget/primary_button.dart';
import 'package:aunkur_farmer/src/common/widget/primary_text_field.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),

      body: Padding(
        padding: const EdgeInsets.all(scaffoldDefaultPadding),
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ForgotPasswordOtpSentState) {
              AppConstantUI.showCustomSnackBar(S.current.newPasswordSent);

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/LoginPage',
                (Route<dynamic> route) => false,
              ); // Navigator.pushReplacementNamed(context, '/OtpPage');
            } else if (state is ForgotPasswordFailureState) {
              AppConstantUI.showCustomSnackBar(state.message, isError: true);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Lottie.asset(
                    AppAssets.forgotPasswordLoti,
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(height: textfieldgap * 2),
                Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: textLineGap),
                Text(
                  "Enter your registered phone number to receive System generated password.",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: textfieldgap),
                StreamBuilder<String>(
                  stream: context.read<ForgotPasswordBloc>().phoneStream,
                  builder: (context, snapshot) {
                    return PrimaryTextField(
                      prefixIcon: AppAssets.callIconSvg,
                      errorText: snapshot.error as String?,
                      controller: phoneNumberController,
                      hintText: "Enter registered phone number",
                      labelText: "Phone",
                      inputFormatters: [
                        maskFormate,
                        LengthLimitingTextInputFormatter(19),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        context.read<ForgotPasswordBloc>().updatePhone(
                          p0,
                          context,
                        );
                      },
                    );
                  },
                ),
                Spacer(),
                StreamBuilder<bool>(
                  stream: context.read<ForgotPasswordBloc>().isValidOtpButtom,
                  builder: (context, snapshot) {
                    return PrimaryButton(
                      isEnable: snapshot.data ?? false,
                      title: "Send",
                      isLoading: state is ForgotPasswordLoadingState,
                      onTap: () {
                        // Navigator.pushReplacementNamed(context, '/OtpPage');

                        context.read<ForgotPasswordBloc>().add(
                          ForgotPasswordSendOtpEvent(
                            phone: phoneNumberController.text,
                          ),
                        );
                        // phoneNumberController.dispose();
                        // Navigator.pushNamed(context, '/OtpPage');
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
