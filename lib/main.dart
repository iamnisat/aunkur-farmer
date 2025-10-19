import 'package:aunkur_farmer/firebase_options.dart';
import 'package:aunkur_farmer/generated/l10n.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:aunkur_farmer/src/feature/language/bloc/language_bloc.dart';
import 'package:aunkur_farmer/src/feature/offline/presentation/cubit/network_cubit.dart';
import 'package:aunkur_farmer/src/routing/routing.dart';
import 'package:aunkur_farmer/src/service/localStorage/local_database_helper.dart';
import 'package:aunkur_farmer/src/service/localStorage/setup.dart';
import 'package:aunkur_farmer/src/service/notification/app_notification_manager.dart';
import 'package:aunkur_farmer/src/utils/jwt_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/utils/theme/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background message
  debugPrint("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  // Initialize local services
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await DatabaseHelper().database();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await init();

  JwtHelper.decodeStoredToken();
  await AuthenticationRepository().initFirebaseMessaging();
  await FirebaseNotificationService.instance.initialize();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NetworkCubit()),
        BlocProvider(create: (_) => LanguageBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkCubit, NetworkState>(
      builder: (context, networkState) {
        String initialRoute = '/SplashPage';
        if (networkState == NetworkState.Disconnected) {
          debugPrint("======> No Connection======>");
          initialRoute = '/NoConnectionScreen';
        }

        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, languageState) {
            return MaterialApp(
              navigatorKey: navigatorKey,

              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              title: AppConstant.appName,
              darkTheme: TAppTheme.lightTheme,
              theme: TAppTheme.lightTheme,
              initialRoute: initialRoute,
              locale: languageState.locale,
            );
          },
        );
      },
    );
  }
}
