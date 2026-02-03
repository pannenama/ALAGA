import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../widgets/primary_button.dart';
import '../routes.dart';

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),

              Image.asset(
                "assets/images/ALAGA_logo.png",
                width: 240,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 18),

              // Tagline: green + bold
              Text(
                "Sa’yo ang tala.\nSa’yo ang alaga!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 34),

              // Select role: bold + slightly spaced
              Text(
                "S E L E C T   Y O U R   R O L E",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.text.withValues(alpha: 0.55),
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 14),

              PrimaryButton(
                text: "Continue as Patient",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.consent),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                text: "Continue as Health Provider",
                isOutline: true,
                onPressed: () => Navigator.pushNamed(context, AppRoutes.consent),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
