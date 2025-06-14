import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/screens/login.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_screen.dart';
// import 'package:stylish/utils/splash_screen.dart';

abstract class AppRoutes {
  static const kLoginscreen = '/loginscreen';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingScreen()),
      GoRoute(
        path: kLoginscreen,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
