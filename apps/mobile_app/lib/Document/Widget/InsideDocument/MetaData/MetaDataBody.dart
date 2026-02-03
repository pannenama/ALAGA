import 'package:alaga/Document/Widget/InsideDocument/AppBar/Tabs.dart';
import 'package:alaga/Document/Widget/InsideDocument/MetaData/MetaDataCard.dart';
import 'package:alaga/Document/Widget/InsideDocument/Summary/SummaryCard.dart';
import 'package:flutter/material.dart';


class MetaDataBody extends StatelessWidget {
  const MetaDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TabsRow(selectedIndex: 0),
          SizedBox(height: 20),
          MetaDataCard(),
          Spacer(),
          ShareButton(),
        ],
      ),
    );
  }
}
