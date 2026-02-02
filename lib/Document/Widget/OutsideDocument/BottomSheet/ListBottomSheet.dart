import 'package:flutter/material.dart';

import '../../../Screen/SummarizedScreen/SummaryDocument.dart';

void ListBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Extracted Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FACILITY NAME',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('St. Luke\'s Medical Center'),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DOC TYPE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Prescription'),
              ],
            ),
            SizedBox(height: 12),
            // Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DATE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('2023-11-20'),
              ],
            ),
            SizedBox(height: 24),
            // Save Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SummaryDocument(),
                    ),
                  );
                },
                child: const Text(
                  'Save to Records',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
