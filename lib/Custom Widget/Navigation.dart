import 'package:ecommars/Custom%20Widget/Imageadd.dart';
import 'package:ecommars/Pages/TextControler.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:image_picker/image_picker.dart';
class Navigetion extends StatelessWidget {
  Navigetion({super.key});







  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
     backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.red,
        color: Color(0xffFDE992),
        animationDuration: Duration(milliseconds: 400),
        items:[

         GestureDetector (child: Icon(Icons.edit)),
          GestureDetector (
            onTap: (){
              Navigator.pushNamed(context,'/textcontroler');
            },
              child: Icon(Icons.add)),
          GestureDetector(
              onTap: (){
              },
              child: Icon(Icons.image_search))
        ] );
  }
}
