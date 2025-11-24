import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/forget_password/presentation/view/screens/forget_password_screen.dart';
import '../../features/forget_password/presentation/view/screens/reset_password_screen.dart';
import '../../features/forget_password/presentation/view/screens/verification_code_screen.dart';

class AppRouter {
  // Route paths
  static const String forgetPassword = '/forget-password';
  static const String verificationCode = '/verification-code';
  static const String resetPassword = '/reset-password';
  static const String login = '/login';
  static const String home = '/home';

  // Router configuration
  static final GoRouter router = GoRouter(
    initialLocation: forgetPassword,
    debugLogDiagnostics: true,
    
    routes: [
      // Forget Password Screen
      GoRoute(
        path: forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),

      // Verification Code Screen
      GoRoute(
        path: verificationCode,
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return VerificationCodeScreen(email: email);
        },
      ),

      // Reset Password Screen
      GoRoute(
        path: resetPassword,
        builder: (context, state) {
          final email = state.extra as String? ?? '';
          return ResetPasswordScreen(email: email);
        },
      ),

      // Add other routes here
    ],
    
    //!============================Error handling===============================
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.matchedLocation}',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(forgetPassword),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    ),
    //!============================Error handling===============================
  );
}