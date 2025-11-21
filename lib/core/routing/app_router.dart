import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/constants/app_reoutes_constants.dart';
import 'package:online_exam_app/feature/search_subjects/presentation/view/screens/subjects_screen.dart';

class AppRouter {
  static const String subjects = "/subjects";

  static GoRouter router = GoRouter(
    initialLocation: AppReoutesConstants.subjects,
    debugLogDiagnostics: true,

    routes: [
      GoRoute(
        path: AppReoutesConstants.subjects ,
        builder: (context, state) => const SubjectsScreen(),
      ),



      /*
    Example : 

    GoRoute(
        path: '/' >>>>>>>>> "from  app routes constants file 😉",
        builder: (context, state) => const SplashScreen(),
      ),

    */
    ],
  );
}
