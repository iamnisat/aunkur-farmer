import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthenticationRepository repo;
  ForgotPasswordBloc(this.repo) : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      // Send the otp into user registered phone number
      try {
        if (event is ForgotPasswordSendOtpEvent) {
          emit(ForgotPasswordLoadingState());
          await repo.forgotPassword(event.phone);
          emit(ForgotPasswordOtpSentState(message: "Please check your phone"));
        }

        // Submit the otp into server for verification
        if (event is ForgotPasswordOtpSubmitEvent) {
          emit(ForgotPasswordLoadingState());
        }

        // API call for change password into server
        if (event is ForgotPasswordSubmitEvent) {
          emit(ForgotPasswordLoadingState());
          await repo.changePassword(
            event.password,
            event.newPassword,
            event.phone,
          );
          emit(
            ForgotPasswordSuccessState(
              message: "Password changed successfully",
            ),
          );
        }
      } on Exception catch (e) {
        emit(ForgotPasswordFailureState(message: e.toString()));
      }
    });
  }

  final _passwordController = BehaviorSubject<String>();
  Stream<String> get passwordStream => _passwordController.stream;

  void updatePassword(String password, BuildContext context) {
    if (password.isEmpty) {
      _passwordController.sink.addError(S.of(context).passwordShouldnotBeEmpty);
      return;
    }
    //  else if (password.length < 8) {
    //   _passwordController.sink.addError(
    //     S.of(context).passwordMustBeAtLeast8Characters,
    //   );
    //   return;
    // }
    _passwordController.sink.add(password);
    return;
  }

  final _phoneController = BehaviorSubject<String>();
  Stream<String> get phoneStream => _phoneController.stream;

  void updatePhone(String phone, BuildContext context) {
    if (phone.isEmpty) {
      _phoneController.sink.addError(
        S.of(context).mobileNumberShouldNotBeEmpty,
      );
      return;
    }
    _phoneController.sink.add(phone);
    return;
  }

  final _newPasswordController = BehaviorSubject<String>();
  Stream<String> get newPasswordStream => _newPasswordController.stream;

  void updateNewPassword(String confirmPass, BuildContext context) {
    if (confirmPass.isEmpty) {
      _newPasswordController.sink.addError(
        S.of(context).passwordShouldnotBeEmpty,
      );
      return;
    }
    //  else if (confirmPass.length < 8) {
    //   _confirmpasswordController.sink.addError(
    //     S.of(context).passwordMustBeAtLeast8Characters,
    //   );
    //   return;
    // } 
    _newPasswordController.sink.add(confirmPass);
    return;
  }

  final _isHidePassword = BehaviorSubject<bool>();
  Stream<bool> get isHideStream => _isHidePassword.stream;

  void updateHidepassword() {
    if (_isHidePassword.hasValue && _isHidePassword.value) {
      _isHidePassword.sink.add(false);
      return;
    }
    _isHidePassword.sink.add(true);
    return;
  }

  Stream<bool> get isValidOtpButtom =>
      Rx.combineLatest2(phoneStream, phoneStream, (a, b) => true);

  Stream<bool> get isValidButton => Rx.combineLatest2(
    passwordStream,
    newPasswordStream,
    (password, newPassword) => true,
  );
}
