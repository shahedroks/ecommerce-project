import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommars/Custom%20Widget/CustomMap.dart';
import 'package:ecommars/Custom%20Widget/Navigation.dart';
import 'package:ecommars/Custom%20Widget/searchber.dart';
import 'package:ecommars/Pages/Product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:icons_plus/icons_plus.dart';
class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
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
        body:
        GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (1/1.6),
            crossAxisSpacing: 8,
            crossAxisCount: 2),
            children: alldata.map((i){
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (builder) => ProductDescription(id: i['id'],)));
                    },
                      child: Custommap(image_url: i['image_url'],name: i['name'],price: i['price'],rating: i['rating'],description: i['description'],)),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: GestureDetector(
                          onTap: (){},
                          child: Icon(Icons.event_busy),),
                      ),
                      Spacer(),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Text('Buy Naw',style: TextStyle(color: Colors.white),),
                        ),
                      )
                    ],
                  )

                ],
              );
            }).toList()
        ),
      );
  }
}
