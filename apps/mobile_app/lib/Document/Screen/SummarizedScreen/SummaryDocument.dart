import 'package:alaga/Document/Widget/InsideDocument/AppBar/HeaderTest.dart';
import 'package:alaga/Document/Widget/InsideDocument/Summary/SummaryBody.dart';
import 'package:flutter/material.dart' hide MetaData;


class SummaryDocument extends StatelessWidget {
  const SummaryDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DocumentAppBar(),
      body: const SummaryBody(),
    );
  }
}
