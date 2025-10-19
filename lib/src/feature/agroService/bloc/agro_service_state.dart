part of 'agro_service_bloc.dart';

sealed class AgroServiceState extends Equatable {
  const AgroServiceState();

  @override
  List<Object> get props => [];
}

final class AgroServiceInitial extends AgroServiceState {}

final class AgroServiceLoading extends AgroServiceState {}

final class AgroServiceLoaded extends AgroServiceState {
  final List<ConversationModel>
  request; // Replace dynamic with your actual data type

  const AgroServiceLoaded(this.request);

  @override
  List<Object> get props => [request];
}

final class AgroServiceEmpty extends AgroServiceState {
  @override
  List<Object> get props => [];
}

final class AgroServiceError extends AgroServiceState {
  final String message;

  const AgroServiceError(this.message);

  @override
  List<Object> get props => [message];
}

final class AgroServiceRequestCreated extends AgroServiceState {
  final String message;

  const AgroServiceRequestCreated(this.message);

  @override
  List<Object> get props => [message];
}
