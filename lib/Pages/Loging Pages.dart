import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Logingpage extends StatefulWidget {
  const Logingpage({super.key});

  @override
  State<Logingpage> createState() => _LogingpageState();
}

class _LogingpageState extends State<Logingpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  void goToDashbord (role){
    switch(role){
      case 'user':
        Navigator.pushReplacementNamed(context, '/mainpage');
        break;
      case 'admin':
        Navigator.pushReplacementNamed(context, '/mainpage');
    }
  }

  void loging()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    var url = Uri.parse('http://68.178.163.174:5501/user/login');
    Map body = {
      'email': email.text,
      'password': password.text,
    };
    http.Response res = await http.post(url, body:body);

    var jsondata = jsonDecode(res.body);
    print (res.body);
    print(res.statusCode);
    if(res.statusCode==201) {
      await prefs.setString('token', jsondata['token']);
      await prefs.setString('id', jsondata['id'].toString());
      await prefs.setString('role', jsondata['role']);
        Fluttertoast.showToast(
            msg: "${jsondata['Login Use']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
        goToDashbord(jsondata['role']);
    }
    else if (res.statusCode == 404){
      Fluttertoast.showToast(
          msg: "${jsondata['Email error']}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: TextField(controller: email,
            decoration: InputDecoration(hintText: 'Email/Number',enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.red),borderRadius: BorderRadius.circular(2)) ),),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),

            child: TextField(controller: password,decoration: InputDecoration(hintText: 'Password',
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),borderRadius: BorderRadius.circular(2))
            ),),
          ),
          ElevatedButton(onPressed: (){
          loging();
    },style: ElevatedButton.styleFrom(backgroundColor: Colors.red[200]), child: Text('Login',
    style: TextStyle(fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
