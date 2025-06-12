import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/screens/login.dart';
import 'package:stylish/utils/splash_screen.dart';

abstract class AppRoutes {
  static const kHomeview = '/homeview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(path: kHomeview, builder: (context, state) => const Login()),
    ],
  );
}
