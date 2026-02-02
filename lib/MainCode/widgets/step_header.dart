import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/text_styles.dart';

class StepHeader extends StatelessWidget {
  final int step;
  final int total;
  final String title;
  final String nextLabel;

  const StepHeader({
    super.key,
    required this.step,
    required this.total,
    required this.title,
    this.nextLabel = "Next: Continue",
  });

  @override
  Widget build(BuildContext context) {
    final progress = step / total;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearProgressIndicator(
          value: progress,
          minHeight: 6,
          backgroundColor: AppColors.border,
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Step $step of $total", style: AppText.muted),
            Text(nextLabel, style: AppText.muted),
          ],
        ),
        const SizedBox(height: 12),
        Text(title, style: AppText.h1),
      ],
    );
  }
}
