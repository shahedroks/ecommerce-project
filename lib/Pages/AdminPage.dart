import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommars/Custom%20Widget/CustomMap.dart';
import 'package:ecommars/Custom%20Widget/Navigation.dart';
import 'package:ecommars/Custom%20Widget/searchber.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';
class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List alldata = [];

 // defind function
  void deletData (id)async {
    var uri = Uri.parse('http://68.178.163.174:5501/product/delete?id=${id}');
    http.Response res = await http.delete(uri);
    GetData();
  }
  void GetData () async {
    var url = Uri.parse('http://68.178.163.174:5501/product');
    http.Response res = await http.get(url);
    var decode = jsonDecode(res.body);
    setState(() {
      alldata=decode;
    });
  }
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
        drawer: Drawer(child: ListView()),

        appBar: AppBar(
          flexibleSpace: Image.asset('Assets/Buy.gif', fit: BoxFit.cover,),
          title: Text('Buy And Sell',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          centerTitle: true,
          actions: [
            Icon(Icons.sell)
          ],
          backgroundColor: Colors.red[300]


        ),
        body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (1/1.6),

         crossAxisSpacing: 8,
            crossAxisCount: 2),
                children: alldata.map((i){
                  return Custommap(image_url: i['image_url'],name: i['name'],price: i['price'],rating: i['rating'],description: i['description'],id: i['id'],GetData: GetData,);
                }).toList()
            ),

        backgroundColor: Colors.white60,
        bottomNavigationBar: Navigetion(),
      );
  }
}
