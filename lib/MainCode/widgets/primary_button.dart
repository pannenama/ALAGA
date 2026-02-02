import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isOutline;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: isOutline ? Colors.white : AppColors.primary,
      foregroundColor: isOutline ? AppColors.primary : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
