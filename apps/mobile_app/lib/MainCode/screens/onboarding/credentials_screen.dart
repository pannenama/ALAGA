import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../widgets/form_field.dart';
import '../../routes.dart';

class CredentialsScreen extends StatelessWidget {
  const CredentialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const StepHeader(step: 2, total: 7, title: "Account Credentials"),
              const SizedBox(height: 16),
              const AppFormField(label: "Mobile Number", hint: "0917 123 4567", requiredField: true, keyboardType: TextInputType.phone),
              const SizedBox(height: 12),
              const AppFormField(label: "Email (Optional)", hint: "juan@example.com", keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),
              const AppFormField(label: "Password", hint: "••••••••", requiredField: true, obscureText: true),
              const SizedBox(height: 12),
              const AppFormField(label: "Confirm Password", hint: "••••••••", requiredField: true, obscureText: true),

              const Spacer(),
              PrimaryButton(
                text: "Next",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.identity),
              )
            ],
          ),
        ),
      ),
    );
  }
}
