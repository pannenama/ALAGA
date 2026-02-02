import 'package:alaga/Document/Widget/InsideDocument/Original/OriginalBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Widget/InsideDocument/AppBar/HeaderTest.dart';

class TestOriginal extends StatefulWidget {
  const TestOriginal({super.key});

  @override
  State<TestOriginal> createState() => _TestOriginalState();
}

class _TestOriginalState extends State<TestOriginal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DocumentAppBar(),
      body: const OriginalBody(),
    );
  }
}
