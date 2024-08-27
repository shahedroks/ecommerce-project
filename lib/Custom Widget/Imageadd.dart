import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imageadd extends StatefulWidget {
   imageadd({super.key});

  @override
  State<imageadd> createState() => _imageaddState();

  File? image;

  void soucegallary ()async{
    var imagepicker = ImagePicker();
    var file =imagepicker.pickImage(source: ImageSource.gallery);
    if ( file != null) {
       setState((){
        image  =File(file.path);
      });
    }
  }
  void soucecamera ()async{
    var imagepicker = ImagePicker();
    var file = imagepicker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState((){
        image = File(file.path);
      });
    }
  }
}

class _imageaddState extends State<imageadd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){

            },
            child: Container(
              decoration: BoxDecoration(color: Colors.black26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt),
                  Text('Chucs Grom Gallary')
                ],
              ),
            ),
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(color: Colors.black26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.browse_gallery),
                  Text('Chucs Grom Gallary')
                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}

