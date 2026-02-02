import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alaga/Document/Widget/InsideDocument/MetaData/MetaDataCard.dart';
import '../../Widget/InsideDocument/AppBar/HeaderTest.dart';



class TestMetaData extends StatefulWidget {
  const TestMetaData({super.key});

  @override
  State<TestMetaData> createState() => _TestMetaDataState();
}

class _TestMetaDataState extends State<TestMetaData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    appBar: const DocumentAppBar(),
    body: const MetaDataCard(),
    );
  }
}
