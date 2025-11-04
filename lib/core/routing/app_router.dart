import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/home_screen.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/login_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    ],
  );
}
