import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../widgets/form_field.dart';
import '../../routes.dart';

class OptionalIdentifiersScreen extends StatelessWidget {
  const OptionalIdentifiersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const StepHeader(step: 6, total: 7, title: "Optional Identifiers"),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Help us build a more complete profile.", style: TextStyle(color: Colors.black54)),
              ),
              const SizedBox(height: 16),
              const AppFormField(label: "PhilHealth ID No.", hint: "XX-XXXXXXXXXX-X"),
              const SizedBox(height: 12),
              const AppFormField(label: "Senior Citizen ID", hint: "ID Number"),
              const SizedBox(height: 12),
              const AppFormField(label: "PWD ID", hint: "ID Number"),
              const SizedBox(height: 12),
              const AppFormField(label: "Blood Type", hint: "e.g. O+"),
              const SizedBox(height: 12),
              const AppFormField(label: "Known Allergies", hint: "e.g. Penicillin, Peanuts"),

              const Spacer(),
              PrimaryButton(
                text: "Next",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.dataAccess),
              )
            ],
          ),
        ),
      ),
    );
  }
}
