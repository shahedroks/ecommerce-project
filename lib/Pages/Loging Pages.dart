import 'package:flutter/material.dart';
class LogingPages extends StatelessWidget { LogingPages({super.key});
  TextEditingController gmail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(controller: gmail,decoration: InputDecoration(hintText: 'Gmail',enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2))),),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(controller: password,decoration: InputDecoration(hintText: 'Password',enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),),
            )),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context,'/mainpage' );
          }, child: Text('Loging'))
        ],
      ),
    );
  }
}
