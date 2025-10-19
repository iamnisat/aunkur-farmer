// lib/src/setup.dart

import 'package:aunkur_farmer/src/feature/chat/bloc/chat_bloc.dart';
import 'package:aunkur_farmer/src/feature/chat/repositories/chat_repo.dart';
import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // 🧩 1️⃣ Register Shared Preferences Helper
  final sharedPreferencesService = await SharedPreferencesHelper.getInstance();
  getIt.registerSingleton<SharedPreferencesHelper>(sharedPreferencesService);

  // 🧩 2️⃣ Register Repositories
  getIt.registerLazySingleton<ChatRepo>(() => ChatRepo());

  // 🧩 3️⃣ Register BLoCs
  // Lazy means it’s created only when first used
  getIt.registerLazySingleton<ChatBloc>(() => ChatBloc(getIt<ChatRepo>()));
}
