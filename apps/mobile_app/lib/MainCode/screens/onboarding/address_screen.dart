import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_header.dart';
import '../../widgets/form_field.dart';
import '../../routes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const StepHeader(step: 4, total: 7, title: "Address & Contact"),
              const SizedBox(height: 16),
              const AppFormField(label: "House No. / Street", hint: "123 Rizal St.", requiredField: true),
              const SizedBox(height: 12),
              const AppFormField(label: "Barangay", hint: "Brgy. San Antonio", requiredField: true),
              const SizedBox(height: 12),
              const AppFormField(label: "City / Municipality", hint: "Naga City", requiredField: true),
              const SizedBox(height: 12),
              const AppFormField(label: "Province", hint: "Camarines Sur", requiredField: true),
              const SizedBox(height: 12),
              const AppFormField(label: "Region", hint: "Region V", requiredField: false),

              const Spacer(),
              PrimaryButton(
                text: "Next",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.emergency),
              )
            ],
          ),
        ),
      ),
    );
  }
}
