import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/helper/shared_pref_key.dart';
import 'package:stylish/core/utils/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _navigateNext);
  }

  void _navigateNext() {
    final sharedPref = sl.get<SharedPref>();

    final bool isFirstTime =
        sharedPref.getBool(SharedPrefKey.isfirstTime) ?? true;
    final bool isLoggedIn = sharedPref.getBool(SharedPrefKey.isLogin) ?? false;

    if (isFirstTime) {
      context.go(AppRoutes.kOnBoardingScreen);
    } else {
      if (isLoggedIn) {
        context.go(AppRoutes.kHomePage);
      } else {
        context.go(AppRoutes.kSignUpScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/icons/splash_icon.png')),
    );
  }
}
