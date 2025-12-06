import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/features/sign_up/presentation/view/screen/sign_up_screen.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            home: child,
          initialRoute: SignUpScreen.routename,
          routes: {
            SignUpScreen.routename:(context)=>SignUpScreen(),
          },
        
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}