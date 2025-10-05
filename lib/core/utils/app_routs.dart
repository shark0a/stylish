import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/Home/presentation/screens/home_page.dart';
import 'package:stylish/Features/Home/presentation/screens/notification_screen.dart';
import 'package:stylish/Features/OnBoardScreen/screens/get_start_screen.dart';
import 'package:stylish/Features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:stylish/Features/auth/presentation/screens/forget_password_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/login_screen.dart';
import 'package:stylish/Features/OnBoardScreen/screens/on_board_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/sign_up_screen.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/splash_screen.dart';

abstract class AppRoutes {
  static const kHomePage = '/homepage';
  static const kGetStartScreen = '/getstartscreen';
  static const kLoginscreen = '/loginscreen';
  static const kSignUpScreen = '/signupscreen';
  static const kForgetPasswordScreen = '/forgetpasswordscreen';
  static const kOnBoardingScreen = '/OnBoardingScreen';
  static const kNotificationScreen = '/NotificationScreen';
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        
        path: kGetStartScreen,
        builder: (context, state) => const GetStartScreen(),
      ),
      GoRoute(
        path: kLoginscreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: const SignupScreen(),
            ),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(path: kHomePage, builder: (context, state) => const HomePage()),
      GoRoute(
        path: kNotificationScreen,
        builder: (context, state) {
          final extra = state.extra;
          final Map<String, dynamic>? data =
              extra is Map<String, dynamic> ? extra : null;
          return NotificationScreen(notificationData: data);
        },
      ),
    ],
  );
}
