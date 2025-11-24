import 'package:flutter/material.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/online_exam_app.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
   configureDependencies();
  runApp(const OnlineExamApp());
}