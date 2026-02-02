import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../config/text_styles.dart';
import '../../routes.dart';
import '../qr_id/qr_id_screen.dart';

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const patientId = "P-2024-8821";

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(Icons.qr_code_2, size: 80),
              const SizedBox(height: 12),
              const Text("All Set!", style: AppText.h1),
              const SizedBox(height: 10),
              Text("Your Patient ID $patientId is ready.", style: AppText.body),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF7EF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  "Show your QR to doctors/pharmacists so they can view relevant records and upload documents.",
                  textAlign: TextAlign.center,
                  style: AppText.muted,
                ),
              ),
              const Spacer(),

              PrimaryButton(
                text: "View QR ID",
                isOutline: true,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QrIdScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                text: "Go to Home",
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.shell,
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
