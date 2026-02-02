import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../widgets/form_field.dart';
import '../../routes.dart';

class IdentityScreen extends StatefulWidget {
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  final _birthdateCtrl = TextEditingController();

  @override
  void dispose() {
    _birthdateCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickBirthdate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900, 1, 1),
      lastDate: now,
    );

    if (picked != null) {
      final mm = picked.month.toString().padLeft(2, '0');
      final dd = picked.day.toString().padLeft(2, '0');
      final yyyy = picked.year.toString();
      _birthdateCtrl.text = "$mm/$dd/$yyyy";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    const StepHeader(step: 3, total: 7, title: "Identity Information"),
                    const SizedBox(height: 16),

                    const AppFormField(label: "First Name", hint: "Juan", requiredField: true),
                    const SizedBox(height: 12),
                    const AppFormField(label: "Middle Name", hint: "Reyes"),
                    const SizedBox(height: 12),
                    const AppFormField(label: "Last Name", hint: "Dela Cruz", requiredField: true),
                    const SizedBox(height: 12),

                    // Birthdate field with DatePicker
                    AppFormField(
                      label: "Birthdate",
                      hint: "mm/dd/yyyy",
                      requiredField: true,
                      controller: _birthdateCtrl,
                      readOnly: true,
                      onTap: _pickBirthdate,
                      suffixIcon: const Icon(Icons.calendar_month),
                    ),

                    const SizedBox(height: 12),
                    const AppFormField(label: "Sex at Birth", hint: "Select Sex", requiredField: true),
                    const SizedBox(height: 12),
                    const AppFormField(label: "Civil Status", hint: "Select Status"),

                    const SizedBox(height: 20), // extra breathing room so it never clips
                  ],
                ),
              ),
            ),

            // Bottom button stays fixed
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
              child: PrimaryButton(
                text: "Next",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.address),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
