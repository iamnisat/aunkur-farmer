part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeProjectListEvent extends HomeEvent {
  const HomeProjectListEvent();
}

class HomeLast7DaysCpvCompletedCountEvent extends HomeEvent {
  const HomeLast7DaysCpvCompletedCountEvent();
}


