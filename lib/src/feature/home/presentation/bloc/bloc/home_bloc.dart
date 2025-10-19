
import 'package:aunkur_farmer/src/feature/home/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository localRepo;
  HomeBloc(this.localRepo) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
     
    });
  }
}
