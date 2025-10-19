part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String message;

  const AuthSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class AuthInitSuccess extends AuthState {}


final class AuthUserProfileLoaded extends AuthState {
  final UserModel user;

  const AuthUserProfileLoaded(this.user);

  @override
  List<Object> get props => [user];
}
