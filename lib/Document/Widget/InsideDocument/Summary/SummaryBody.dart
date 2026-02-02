import 'package:alaga/Document/Widget/InsideDocument/Summary/SummaryCard.dart';
import 'package:alaga/Document/Widget/InsideDocument/AppBar/Tabs.dart';
import 'package:flutter/cupertino.dart';

class SummaryBody extends StatelessWidget {
  final int selectedTab;
  const SummaryBody({super.key, this.selectedTab = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TabsRow(selectedIndex: 0),
          SizedBox(height: 20),
          SummaryCard(),
          SizedBox(height: 24),
          ExtractedText(),
          Spacer(),
          ShareButton(),
        ],
      ),
    );
  }
}
