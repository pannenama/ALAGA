import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../config/text_styles.dart';
import '../../routes.dart';

class ConsentScreen extends StatelessWidget {
  const ConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool terms = true;
    bool localStorage = true;
    bool aiAssist = false;

    // For MVP, keep them visually but static.
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepHeader(step: 1, total: 7, title: "Data Privacy & Consent"),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFF7F8FA),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Privacy Notice Summary", style: AppText.h2),
                    SizedBox(height: 8),
                    Text(
                      "• Collects minimal information required for medical services.\n"
                      "• Stored locally on your device and synced when online.\n"
                      "• AI (MADA) summaries assist understanding and may require verification.",
                      style: AppText.muted,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _checkboxRow("Terms & Privacy", "I agree to the Terms and Privacy Notice.", terms),
              _checkboxRow("Local Storage & Sync", "I consent to storing data locally and syncing when online.", localStorage),
              _checkboxRow("AI Assistance", "I understand AI summaries assist only and may require verification.", aiAssist),

              const Spacer(),
              PrimaryButton(
                text: "Continue",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.credentials),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkboxRow(String title, String subtitle, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(value ? Icons.check_circle : Icons.radio_button_unchecked),
      title: Text(title, style: AppText.h2),
      subtitle: Text(subtitle, style: AppText.muted),
    );
  }
}
// test