import 'package:flutter/material.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/shared_preferences_module/shared_preferences_module.dart';
import 'package:online_exam_app/core/constants/cache_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CacheHelper cacheHelper = getIt<CacheHelper>();
  String? token;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  void _loadToken() {
    final savedToken = cacheHelper.getString(CacheConstants.token);
    setState(() {
      token = savedToken;
    });
    print('Loaded token: $token');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Text(
          token == null
              ? 'Loading token...'
              : 'Welcome to the Home Screen!\nToken: $token',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
