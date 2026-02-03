// ignore_for_file: prefer_const_constructors_in_immutables
import 'dart:io';
import 'package:flutter/material.dart';

class RecognizerScreen extends StatefulWidget {
  final File image; //dart io widget that turns image into file
  RecognizerScreen(this.image, {super.key}); //makes placeholder

  @override
  State<RecognizerScreen> createState() => _RecognizerScreenState();
}

class _RecognizerScreenState extends State<RecognizerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text('scan complete')), //Use this to make headers
      body: Image.file(widget.image),
    );
  }
}

