import 'package:go_router/go_router.dart';
import 'package:stylish/Features/OnBoardScreen/screens/get_start_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/forget_password_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/login_screen.dart';
import 'package:stylish/Features/OnBoardScreen/screens/on_board_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/sign_up_screen.dart';

abstract class AppRoutes {
  static const kOnBoardScreen = '/onboardscreen';
  static const kLoginscreen = '/loginscreen';
  static const kSignUpScreen = '/signupscreen';
  static const kForgetPasswordScreen = '/forgetpasswordscreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const GetStartScreen()),
      GoRoute(
        path: kOnBoardScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: kLoginscreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
    ],
  );
}
