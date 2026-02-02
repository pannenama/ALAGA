import 'package:alaga/Document/Widget/OutsideDocument/BottomSheet/LoadSuccessful.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../../Screen/SummarizedScreen/SummaryDocument.dart';

class LoadingBottomSheet extends StatefulWidget {
  const LoadingBottomSheet({super.key});

  @override
  State<LoadingBottomSheet> createState() => _LoadingBottomSheetState();
}

class _LoadingBottomSheetState extends State<LoadingBottomSheet> {
  late ValueNotifier<double> valueNotifier;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    valueNotifier = ValueNotifier<double>(0);

    // Listen for completion
    valueNotifier.addListener(() {
      if (valueNotifier.value >= 102 && !_navigated) {
        _nextScreen();
      }
    });

    _startProgress();
  }

  void _startProgress() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 70));
      valueNotifier.value++;
      return valueNotifier.value <= 102;
    });
  }

  void _nextScreen() {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const LoadSuccessful(),
    );
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1, // Full width
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),


            const Text(
              'Loading Document',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 24),

            // circular progress bar
            SimpleCircularProgressBar(
              valueNotifier: valueNotifier,
              mergeMode: true,
              size: 150,
              progressStrokeWidth: 20,
              backStrokeWidth: 20,
              onGetText: (double value) {
                return Text(
                  '${value.toInt()}%',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            const Text(
              'Please wait a moment...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
