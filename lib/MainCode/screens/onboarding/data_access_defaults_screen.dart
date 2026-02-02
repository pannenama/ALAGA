import 'package:flutter/material.dart';

import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../config/text_styles.dart';
import '../../routes.dart';
import '../../services/profile_store.dart';

class DataAccessDefaultsScreen extends StatelessWidget {
  const DataAccessDefaultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Static toggles for MVP
    const bool allowQrAccessOnly = true;
    const bool allowTrustedVerify = true;
    const bool allowUntrustedAdd = true;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepHeader(
                step: 7,
                total: 7,
                title: "Data Access Defaults",
                nextLabel: "Final Review",
              ),
              const SizedBox(height: 16),

              _toggleCard(
                "Allow providers to access record ONLY after QR scan",
                allowQrAccessOnly,
              ),
              const SizedBox(height: 12),

              _toggleCard(
                "Allow trusted providers to verify documents",
                allowTrustedVerify,
              ),
              const SizedBox(height: 12),

              _toggleCard(
                "Allow non-trusted providers to add documents but NOT verify",
                allowUntrustedAdd,
              ),

              const Spacer(),

              PrimaryButton(
                text: "Finish Setup",
                onPressed: () async {
                  // 🔹 DEMO SAVE (replace with real values later)
                  await ProfileStore.saveProfile(
                    firstName: "Juan",
                    middleName: "Reyes",
                    lastName: "Dela Cruz",
                    birthdate: "05/12/1990",
                  );

                  if (!context.mounted) return;

                  Navigator.pushNamed(context, AppRoutes.allSet);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toggleCard(String title, bool on) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: AppText.body),
          ),
          Switch(
            value: on,
            onChanged: (_) {}, // static for MVP
          ),
        ],
      ),
    );
  }
}
