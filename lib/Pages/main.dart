import 'package:ecommars/Pages/Home.dart';
import 'package:ecommars/Pages/Loging%20Pages.dart';
import 'package:ecommars/Pages/TextControler.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Logingpage(),
      '/mainpage' : (context) => MainPages(),
      '/textcontroler': (context) => TextControler()
  },
  ));
}