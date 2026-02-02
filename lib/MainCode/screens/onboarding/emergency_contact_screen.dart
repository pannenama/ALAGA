import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../widgets/form_field.dart';
import '../../routes.dart';

class EmergencyContactScreen extends StatelessWidget {
  const EmergencyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const StepHeader(step: 5, total: 7, title: "Emergency Contact"),
              const SizedBox(height: 16),
              const AppFormField(label: "Contact Name", hint: "Maria Dela Cruz", requiredField: true),
              const SizedBox(height: 12),
              const AppFormField(label: "Relationship", hint: "Select Relationship", requiredField: true),
              const SizedBox(height: 12),
              const AppFormField(label: "Mobile Number", hint: "0917 999 8888", requiredField: true, keyboardType: TextInputType.phone),

              const Spacer(),
              PrimaryButton(
                text: "Next",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.optionalIds),
              )
            ],
          ),
        ),
      ),
    );
  }
}
