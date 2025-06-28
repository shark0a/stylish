import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/OnBoardScreen/screens/get_start_screen.dart';
import 'package:stylish/Features/auth/data/manager/auth_cubit.dart';
import 'package:stylish/Features/auth/data/repo/auth_repo.dart';
import 'package:stylish/Features/auth/presentation/screens/forget_password_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/login_screen.dart';
import 'package:stylish/Features/OnBoardScreen/screens/on_board_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/sign_up_screen.dart';
import 'package:stylish/core/utils/services_locator.dart';

abstract class AppRoutes {
  // static const kOnBoardScreen = '/onboardscreen';
  static const kGetStartScreen = '/getstartscreen';
  static const kLoginscreen = '/loginscreen';
  static const kSignUpScreen = '/signupscreen';
  static const kForgetPasswordScreen = '/forgetpasswordscreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
      GoRoute(
        path: kGetStartScreen,
        builder: (context, state) => const GetStartScreen(),
      ),
      GoRoute(
        path: kLoginscreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepo>()),
              child: const LoginScreen(),
            ),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder:
            (context, state) => BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepo>()),
              child: const SignupScreen(),
            ),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
    ],
  );
}
