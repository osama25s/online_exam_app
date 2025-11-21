import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/constants/app_reoutes_constants.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/home_screen.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/login_screen.dart';
import 'package:online_exam_app/features/questions/presentation/views/screens/questions_screen.dart';
import 'package:online_exam_app/features/splash/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppReoutesConstants.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppReoutesConstants.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppReoutesConstants.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppReoutesConstants.questionsScreen,
        builder: (context, state) => QuestionsScreen(),
      ),
    ],
  );
}
