import 'package:ecommars/Function/Provider.dart';
import 'package:ecommars/Pages/AdminPage.dart';
import 'package:ecommars/Pages/Loging%20Pages.dart';
import 'package:ecommars/Pages/Add_Product.dart';
import 'package:ecommars/Pages/Product.dart';
import 'package:ecommars/Pages/Register.dart';
import 'package:ecommars/Pages/User_id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) =>GetDataProvider())
  ],
    child: MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Logingpage(),
        '/userpage': (context) => UserPage(),
        '/adminpage' : (context) => AdminPage(),
        '/addproduct': (context) => DataAdd(),
        '/productdescription': (context)=> ProductDescription(),
        '/register': (context) => Register()
    },
      debugShowCheckedModeBanner: false,
    ),
  ));
}