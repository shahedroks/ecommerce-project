import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommars/Custom%20Widget/CustomMap.dart';
import 'package:ecommars/Custom%20Widget/Navigation.dart';
import 'package:ecommars/Custom%20Widget/searchber.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MainPages extends StatefulWidget {
  const MainPages({super.key});

  @override
  State<MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<MainPages> {
  List alldata = [];

 // defind function

  void GetData () async {
    var url = Uri.parse('http://68.178.163.174:5501/product');
    http.Response res = await http.get(url);
    var decode = jsonDecode(res.body);
    setState(() {
      alldata=decode;
    });
  }
@override
@override
  void initState() {
    // TODO: implement initState
      super.initState();
      GetData();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1/1.4),

         crossAxisSpacing: 8,
            crossAxisCount: 2),
                children: alldata.map((i){
                  return Custommap(image_url: i['image_url'],name: i['name'],price: i['price'],rating: i['rating'],description: i['description'],);
                }).toList()
            ),

        backgroundColor: Colors.white60,
        bottomNavigationBar: Navigetion(),
      );
  }
}
