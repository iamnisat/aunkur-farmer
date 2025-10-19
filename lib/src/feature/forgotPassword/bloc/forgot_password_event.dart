part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordSubmitEvent extends ForgotPasswordEvent {
  final String password;
  final String newPassword;
  final String phone;
  const ForgotPasswordSubmitEvent({
    required this.password,
    required this.newPassword,
    required this.phone,
  });
  @override
  List<Object> get props => [password, newPassword, phone];
}


class ForgotPasswordSendOtpEvent extends ForgotPasswordEvent {
  final String phone;
  const ForgotPasswordSendOtpEvent({
    required this.phone,
  });
  @override
  List<Object> get props => [phone];
}

class ForgotPasswordOtpSubmitEvent extends ForgotPasswordEvent {
  final String otp;
  final String phone;
  const ForgotPasswordOtpSubmitEvent({
    required this.otp,
    required this.phone,
  });
  @override
  List<Object> get props => [otp, phone];
}
