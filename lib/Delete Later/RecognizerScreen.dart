import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecognizerScreen extends StatefulWidget {
  File image; //dart io widget that turns image into file
  RecognizerScreen(this.image); //makes placeholder

  @override
  State<RecognizerScreen> createState() => _RecognizerScreenState();
}

class _RecognizerScreenState extends State<RecognizerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text('scan complete')), //Use this to make headers
      body: Container(
        child: Image.file(this.widget.image) //displays image
      ),
    );
  }
}

