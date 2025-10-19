
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/function/common_function.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum NetworkState { Connected, Disconnected }

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();

  NetworkCubit() : super(NetworkState.Connected) {
    _monitorInternetConnection();
  }

  void _monitorInternetConnection() {
    debugPrint("======> Monitoring Internet Connection======>");
    _connectivity.onConnectivityChanged.listen((result) {
      debugPrint("======> Connectivity Changed: $result");
      if (result
          .where((element) => element == ConnectivityResult.none)
          .isNotEmpty) {
       
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          '/NoConnectionScreen',
        );

        emit(NetworkState.Disconnected);
      } else {
        // If NoConnectionScreen is currently active, pop it
        if ( CommonFunction.isRouteActive(
            navigatorKey.currentContext!, '/NoConnectionScreen')) {
          Navigator.pop(navigatorKey.currentContext!);
        }

        // Dispose the NoConnectionScreen
        // At firs check if the screen is already pushed or not
        // if pushed then pop it
        // if not then do nothing

        emit(NetworkState.Connected);
      }
    });
  }

  // Call this to manually trigger a network check
  Future<void> checkConnection() async {
    var result = await _connectivity.checkConnectivity();
    if (result
        .where((element) => element == ConnectivityResult.none)
        .isNotEmpty) {
      emit(NetworkState.Disconnected);
    } else {
      emit(NetworkState.Connected);
    }
  }


}