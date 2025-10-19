import 'package:aunkur_farmer/src/feature/agroService/bloc/agro_service_bloc.dart';
import 'package:aunkur_farmer/src/feature/agroService/presentation/page/agro_service_request_page.dart';
import 'package:aunkur_farmer/src/feature/agroService/presentation/page/create_agro_service_request_page.dart';
import 'package:aunkur_farmer/src/feature/agroService/repositories/agro_service_repo.dart';
import 'package:aunkur_farmer/src/feature/authentication/bloc/auth_bloc.dart';
import 'package:aunkur_farmer/src/feature/authentication/presentation/page/login_page.dart';
import 'package:aunkur_farmer/src/feature/authentication/presentation/page/registration_page.dart';
import 'package:aunkur_farmer/src/feature/authentication/repositories/authentication_repository.dart';
import 'package:aunkur_farmer/src/feature/chat/bloc/chat_bloc.dart';
import 'package:aunkur_farmer/src/feature/chat/presentation/page/chat_room_page.dart';
import 'package:aunkur_farmer/src/feature/chat/repositories/chat_repo.dart';
import 'package:aunkur_farmer/src/feature/crop/bloc/crop_bloc.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/page/crop_list_page.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/page/crop_profile.dart';
import 'package:aunkur_farmer/src/feature/crop/presentation/page/pesticide_and_disease_details.dart';
import 'package:aunkur_farmer/src/feature/crop/repositories/crop_repo.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/bloc/forgot_password_bloc.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/presentation/page/forgot_password.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/presentation/page/new_password_page.dart';
import 'package:aunkur_farmer/src/feature/forgotPassword/presentation/page/opt_page.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/page/home_page.dart';
import 'package:aunkur_farmer/src/feature/home/presentation/page/root_screen.dart';
import 'package:aunkur_farmer/src/feature/news/bloc/news_bloc.dart';
import 'package:aunkur_farmer/src/feature/news/presentation/page/news_list_page.dart';
import 'package:aunkur_farmer/src/feature/news/repositories/news_repo.dart';
import 'package:aunkur_farmer/src/feature/notification/presentation/page/notification_page.dart';
import 'package:aunkur_farmer/src/feature/offline/presentation/page/no_connection_screen.dart';
import 'package:aunkur_farmer/src/feature/splash/splash_page.dart';
import 'package:aunkur_farmer/src/routing/custom_page_route.dart';
import 'package:aunkur_farmer/src/service/localStorage/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/LoginPage':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthenticationRepository(),
            child: BlocProvider(
              create: (context) => AuthBloc(context.read()),
              child: const LoginPage(),
            ),
          ),
        );
      //
      case '/RegistrationPage':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthenticationRepository(),
            child: BlocProvider(
              create: (context) => AuthBloc(context.read()),
              child: const RegistrationPage(),
            ),
          ),
        );

      case '/RootScreen':
        return MaterialPageRoute(
          builder: (_) => RootScreen(initIndex: args as int),
        );

      case '/HomePage':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/ForgotPassword':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthenticationRepository(),
            child: BlocProvider(
              create: (context) =>
                  ForgotPasswordBloc(context.read<AuthenticationRepository>()),
              child: ForgotPasswordPage(),
            ),
          ),
        );

      case '/CropProfile':
        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider(
            create: (context) => CropRepo(),
            child: BlocProvider(
              create: (context) =>
                  CropBloc(context.read<CropRepo>())
                    ..add(CropDetailRequestEvent(settings.arguments as int)),
              child: CropProfile(cropId: settings.arguments as int),
            ),
          ),
        );
      case '/CropListPage':
        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider(
            create: (context) => CropRepo(),
            child: BlocProvider(
              create: (context) => CropBloc(context.read<CropRepo>())..add(
                  CropListRequestEvent(
                    page: 1,
                    size: 100,
                  ),
                ),
              child: const CropListPage(),
            ),
          ),
        );

      case '/PesticideAndDisease':
        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider(
            create: (context) => CropRepo(),
            child: PesticideAndDisease(
              pesticideName:
                  (settings.arguments as Map)['pesticideName'] as String,
              cropId: (settings.arguments as Map)['cropId'] as int,
              pesticideId: (settings.arguments as Map)['pesticideId'] as int,
            ),
          ),
        );

      case '/OtpPage':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthenticationRepository(),
            child: BlocProvider(
              create: (context) =>
                  ForgotPasswordBloc(context.read<AuthenticationRepository>()),
              child: const OtpPage(),
            ),
          ),
        );

      case '/NewPasswordPage':
        return MaterialPageRoute(
          builder: (_) => RepositoryProvider(
            create: (context) => AuthenticationRepository(),
            child: BlocProvider(
              create: (context) =>
                  ForgotPasswordBloc(context.read<AuthenticationRepository>()),
              child: const NewPasswordPage(),
            ),
          ),
        );
      // SplashPage
      case '/SplashPage':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      //NoConnectionScreen
      case '/NoConnectionScreen':
        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: NoConnectionScreen(onRetry: () {}),
        );

      case '/AgroServiceRequestPage':
        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider(
            create: (context) => AgroServiceRepo(),
            child: BlocProvider(
              create: (context) =>
                  AgroServiceBloc(context.read<AgroServiceRepo>())
                    ..add(LoadAgroServiceEvent()),
              child: const AgroServiceRequestPage(),
            ),
          ),
        );

      case '/CreateAgroServiceRequestPage':
        return CustomPageRoute<bool?>(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider(
            create: (context) => AgroServiceRepo(),
            child: BlocProvider(
              create: (context) =>
                  AgroServiceBloc(context.read<AgroServiceRepo>()),
              child: const CreateAgroServiceRequestPage(),
            ),
          ),
        );

      case '/ChatRoomPage':
        final conversationId = settings.arguments as int;

        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider.value(
            value: getIt<ChatRepo>(), // ✅ Use same ChatRepo from GetIt
            child: BlocProvider.value(
              value: getIt<ChatBloc>()
                ..add(
                  ChatMessageEvent(
                    conversationId: conversationId,
                    page: 1,
                    limit: 20,
                  ),
                ),
              child: ChatRoomPage(conversationId: conversationId),
            ),
          ),
        );

      case '/NewsListPage':
        return CustomPageRoute(
          settings: settings,
          direction: AxisDirection.left,
          page: RepositoryProvider(
            create: (context) => NewsRepo(),
            child: BlocProvider(
              create: (context) => NewsBloc(context.read<NewsRepo>()),
              child: const NewsListPage(),
            ),
          ),
        );

      case '/NotificationPage':
        return MaterialPageRoute(builder: (_) => const NotificationPage());

      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
