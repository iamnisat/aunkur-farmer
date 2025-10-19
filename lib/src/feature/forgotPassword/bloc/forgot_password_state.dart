part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordSuccessState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordFailureState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ForgotPasswordOtpSentState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordOtpSentState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class ForgotPasswordOtpVerifiedState extends ForgotPasswordState {
  final String message;
  const ForgotPasswordOtpVerifiedState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
