import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/routing/app_router.dart';
import 'package:online_exam_app/core/theme/app_theme.dart';
import 'package:online_exam_app/feature/sign_up/presentation/view/screen/screen.dart';
import 'package:online_exam_app/feature/sign_up/presentation/view/screen/sign_up_screen.dart';

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(

          initialRoute: Screen.routname,
          routes: {
            Screen.routname:(context)=>Screen(),
          },
          // routerConfig: AppRouter.router,
          // theme: AppTheme.appTheme,
          // debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}