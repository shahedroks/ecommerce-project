import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommars/Custom%20Widget/CustomMap.dart';
import 'package:ecommars/Custom%20Widget/Navigation.dart';
import 'package:ecommars/Custom%20Widget/Product.dart';
import 'package:ecommars/Custom%20Widget/searchber.dart';
import 'package:ecommars/Function/Provider.dart';
import 'package:ecommars/Pages/Product.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_font_icons/flutter_font_icons.dart';



class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List alldata = [];
  Map data ={};
  List image=[
  'Asstes/Offer.gif',
    'Asstes/Source.gif'
  ];
  // defind function
  void GetData () async {
    var url = Uri.parse('http://68.178.163.174:5501/product');
    http.Response res = await http.get(url);
    var decode = jsonDecode(res.body);
    setState(() {
      alldata=decode.map((el)=>Product.fromJeson(el)).toList();
    });
  }
 void GetIDData()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
  String? user_id = pref.getString('user_id').toString();
  var url = Uri.parse('http://68.178.163.174:5501/user?id=${user_id}');
  http.Response res = await http.get(url);
  var decode = jsonDecode(res.body);
  setState(() {
    data = decode;
  });

 }
  PageController pageController=PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetData();
    GetIDData();
  }
  @override
  Widget build(BuildContext context) {
    GetDataProvider provider = GetDataProvider.of(context);

    return
      Scaffold(
        drawer: Drawer(child: ListView(
          children: [
         UserAccountsDrawerHeader(
             accountName:Text('${data['name']}'),
             accountEmail:Text('${data['email']}'),
             decoration: BoxDecoration(color: Color(0xffFDE992))),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('profile'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text('Policy'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('profile'),
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Detalils'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Delete Accaunt'),
            )
          ],
        )),
        appBar: AppBar(
            flexibleSpace: Image.asset('Assets/Buy.gif', fit: BoxFit.cover,),
            title: Text('Buy And Sell',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
            centerTitle: true,
            actions: [
              Stack(
                  children: [
                    Icon(Iconsax.buy_crypto_outline),
                    Positioned(
                      top: 0,

                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),

                        child: Text('${provider.cardQuantity}',style: TextStyle(fontSize: 10,color: Colors.red),),

                      ),
                    )
                  ],
              )
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
                          onTap: (){
                            provider.AddToCard(i);
                          },
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
