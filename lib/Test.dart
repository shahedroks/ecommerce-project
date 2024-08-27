import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Testt extends StatelessWidget {
   Testt({super.key});
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

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
;