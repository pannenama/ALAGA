import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/text_styles.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool requiredField;
  final TextInputType keyboardType;
  final bool obscureText;

  // NEW
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  const AppFormField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.requiredField = false,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(requiredField ? "$label *" : label, style: AppText.muted),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
