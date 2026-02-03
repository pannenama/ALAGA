import 'package:alaga/Document/Screen/SummarizedScreen/SummaryDocument.dart';
import 'package:alaga/Document/Screen/SummarizedScreen/MetaDataDocument.dart';
import 'package:alaga/Document/Screen/SummarizedScreen/OriginalDocument.dart';
import 'package:alaga/Document/Widget/InsideDocument/AppBar/TabsButton.dart';
import 'package:flutter/material.dart';

class TabsRow extends StatelessWidget {
  final int selectedIndex; // 0 = Summary, 1 = Original, 2 = Metadata
  final Function(int)? onTabTapped;

  const TabsRow({super.key, required this.selectedIndex, this.onTabTapped});

  void _navigateTo(BuildContext context, int index) {
    // Call optional callback
    if (onTabTapped != null) onTabTapped!(index);

    // Navigate to the correct screen
    Widget screen;
    switch (index) {
      case 0:
        screen = const SummaryDocument();
        break;
      case 1:
        screen = const TestOriginal();
        break;
      case 2:
        screen = const TestMetaData();
        break;
      default:
        screen = const SummaryDocument();
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEFF5), // grey background
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          TabButton(
            title: 'SUMMARY',
            selected: selectedIndex == 0,
            onTap: () => _navigateTo(context, 0),
          ),
          TabButton(
            title: 'ORIGINAL',
            selected: selectedIndex == 1,
            onTap: () => _navigateTo(context, 1),
          ),
          TabButton(
            title: 'METADATA',
            selected: selectedIndex == 2,
            onTap: () => _navigateTo(context, 2),
          ),
        ],
      ),
    );
  }
}
