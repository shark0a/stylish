import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/screens/forget_password_page.dart';
import 'package:stylish/Features/auth/presentation/screens/login_page.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_screen.dart';
import 'package:stylish/Features/auth/presentation/screens/signup_page.dart';

abstract class AppRoutes {
  static const kLoginscreen = '/loginscreen';
  static const kSignUpScreen = '/signupscreen';
  static const kForgetPasswordScreen = '/forgetpasswordscreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
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
