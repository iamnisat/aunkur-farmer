import 'dart:async';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/app_asset.dart';
import 'package:aunkur_farmer/src/common/constant/app_colors.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/service/localStorage/setup.dart';
import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';
import 'package:aunkur_farmer/src/service/permission/permission_handler.dart';
import 'package:flutter/material.dart';

final preference = getIt<SharedPreferencesHelper>();

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    PermissionHandler().requestPermission();

    // Animation setup
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));

    final token = preference.getString(AppConstant.TOKEN);
    if (token.isNotEmpty) {
      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
        '/RootScreen',
        (Route<dynamic> route) => false,
        arguments: 0,
      );
    } else {
      Navigator.of(navigatorKey.currentContext!)
          .pushNamedAndRemoveUntil('/LoginPage', (Route<dynamic> route) => false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo animation
              ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: size.width * 0.35,
                    height: size.width * 0.35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 12,
                          spreadRadius: 4,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Image.asset(
                      AppAssets.appLogo, // <-- your app logo
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // App Name
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  "Aunkur Farmer",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryBlack,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Tagline
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  "Growing with knowledge 🌱",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Subtle progress indicator
              FadeTransition(
                opacity: _fadeAnimation,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
