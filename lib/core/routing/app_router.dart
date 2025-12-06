import 'package:go_router/go_router.dart';
import 'package:online_exam_app/features/sign_up/presentation/view/screen/sign_up_screen.dart';
import 'package:online_exam_app/core/constants/app_reoutes_constants.dart';
import 'package:online_exam_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:online_exam_app/features/login/presentation/views/screens/login_screen.dart';
import 'package:online_exam_app/features/splash/splash_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [


    GoRoute(
        path: '/',
        builder: (context, state) =>  SignUpScreen(),),
      GoRoute(
        path: AppRoutesConstants.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppRoutesConstants.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutesConstants.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),

    
    ],
  );
}
