part of 'agro_service_bloc.dart';

sealed class AgroServiceEvent extends Equatable {
  const AgroServiceEvent();

  @override
  List<Object> get props => [];
}

class LoadAgroServiceEvent extends AgroServiceEvent {}

class AgroServiceListEvent extends AgroServiceEvent {}

class AgroServiceRequestCreateEvent extends AgroServiceEvent {}
