import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'RecognizerScreen.dart';
import 'Bottom sheet test.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late ImagePicker imagePicker; //to pick images
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40,bottom: 15,left: 5, right: 5), //Nav bar
      child: Column(
        //things in header
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            //Card is what we use for icons
            color: Colors.blueAccent,
            child: Container(
              height: 70,
              child: Row( //alt + enter Icon to wrap inkwell widget to add click function
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //spaces things in a container like in godot
                children: [
                  InkWell( // Inkwell is used to give icons functions
                    child: Column( //Alt + enter to wrap column
                      mainAxisAlignment: MainAxisAlignment.center, //Alt + enter to wrap column
                      children: [
                        Icon(Icons.scanner, size: 30, color: Colors.white),
                        Text('Scan', style: TextStyle(color: Colors.white),)
                      ],
                    ),
                    onTap: (){

                    },),
                  InkWell(
                    child: Icon(Icons.document_scanner_sharp, size: 30, color: Colors.white),
                    onTap: (){

                    },),
                  InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined, size: 30, color: Colors.white),
                        Text('Scan', style: TextStyle(color: Colors.white))
                      ]
                    ),
                    onTap: (){

                    },),

                ],
              ),
            ),
          ), //header
          Card(
            color: Colors.black,
              child: Container(
                  height: MediaQuery.of(context).size.height-300
              )
          ),
          Card(
            //Card is what we use for icons
            color: Colors.blueAccent,
            child: Container(
              height: 100,
              child: Row( //alt + enter Icon to wrap inkwell widget to add click function
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //spaces things in a container like in godot
                children: [
                  InkWell( // Inkwell is used to give icons functions
                    child: Icon(Icons.rotate_left, size: 40, color: Colors.white),
                    onTap: (){

                  },),
                  InkWell(
                    child: Icon(Icons.camera, size: 50, color: Colors.white),
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      XFile? xfile = await picker.pickImage(source: ImageSource.camera);
                      if(xfile != null){ //moves to the RecognizerScreen once image was picked
                        File image = File(xfile.path); //dart.io converting image to file
                        Navigator.push(context, MaterialPageRoute(builder: (ctw){
                          return RecognizerScreen(image);
                        }));
                      }
                    }),
                  InkWell(
                    child: Icon(Icons.image_outlined, size: 40, color: Colors.white),
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      XFile? xfile = await picker.pickImage(source: ImageSource.gallery,);
                      if(xfile != null){ //moves to the RecognizerScreen once image was picked
                        File image = File(xfile.path); //dart.io converting image to file
                        Navigator.push(context, MaterialPageRoute(builder: (ctw){
                          return RecognizerScreen(image);
                        }));
                      }
                    }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
