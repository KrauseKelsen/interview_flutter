import 'package:flutter/material.dart';
import 'package:interview_flutter/config/router/app_router.dart';
import 'package:interview_flutter/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 3).getTheme(),
        title: 'WeatherForemost',
        routerConfig: appRouter,
    );
  }
}
