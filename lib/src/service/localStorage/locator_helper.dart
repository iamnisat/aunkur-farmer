import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';
import 'package:get_it/get_it.dart';

final locatorHelper = GetIt.instance;

Future<void> setUpLocator() async {
  // Register services
  final sharedPreferencesService = await SharedPreferencesHelper.getInstance();
  locatorHelper.registerSingleton(sharedPreferencesService);
  
}