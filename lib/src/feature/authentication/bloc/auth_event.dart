part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLoginRequestEvent extends AuthEvent {
  final String phone;
  final String password;

  const AuthLoginRequestEvent({required this.phone, required this.password});

  @override
  List<Object> get props => [phone, password];
}

final class AuthRegistrationRequest extends AuthEvent{}

final class AuthLogoutEvent extends AuthEvent {}

final class AuthSignInLoadingEvent extends AuthEvent {}

final class AuthInitialEvent extends AuthEvent {}

final class AuthUserProfileEvent extends AuthEvent {}


