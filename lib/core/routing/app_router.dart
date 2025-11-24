import 'package:go_router/go_router.dart';
import 'package:online_exam_app/core/constants/app_reoutes_constants.dart';
import '../../features/get_all_exams_on_subject/presentation/view/screens/exams_screen.dart';

class AppRouter {
  // Router configuration
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutesConstants.exams, // غيّر ده عشان يبدأ من Exams
    debugLogDiagnostics: true,

    routes: [
      GoRoute(
        path: AppRoutesConstants.exams,
        builder: (context, state) => ExamsScreen(),
      ),
      // Add other routes here
    ],

    //!================== Error handling ==================
    // errorBuilder: (context, state) => Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const Icon(Icons.error_outline, size: 48, color: Colors.red),
    //         const SizedBox(height: 16),
    //         Text(
    //           'Page not found: ${state.matchedLocation}',
    //           textAlign: TextAlign.center,
    //         ),
    //         const SizedBox(height: 16),
    //         ElevatedButton(
    //           onPressed: () => context.go(exams),
    //           child: const Text('Go to Exams'),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
    //!================== Error handling ==================

  );
}
