import 'package:flutter/material.dart';
import 'MainCode/config/app_colors.dart';
import 'MainCode/routes.dart';



void main() {
  runApp(const AlagaApp());
}

class AlagaApp extends StatelessWidget {
  const AlagaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ALAGA MVP",
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.role,
    );
  }
}
