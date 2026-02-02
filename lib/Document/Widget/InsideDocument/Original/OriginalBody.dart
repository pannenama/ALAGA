import 'package:flutter/cupertino.dart';
import '../AppBar/Tabs.dart';
import '../Summary/SummaryCard.dart';

class OriginalBody extends StatefulWidget {
  const OriginalBody({super.key});

  @override
  State<OriginalBody> createState() => _OriginalBodyState();
}

class _OriginalBodyState extends State<OriginalBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabsRow(selectedIndex: 1),
          const SizedBox(height: 20),

          Image.asset(
            'assets/images/PRESCRIPTION.jpg',
            width: double.infinity,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 16),
          const Spacer(),
          const ShareButton(),
        ],
      ),

    );
  }
}
