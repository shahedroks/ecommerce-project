import 'dart:convert';

import 'package:ecommars/Function/Provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ProductDescription extends StatefulWidget {
  var id;
   ProductDescription({super.key,this.id});
  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}
class _ProductDescriptionState extends State<ProductDescription> {

  Map data = {};
  var conter = 1;

  void GetData ()async{
    var url = Uri.parse('http://68.178.163.174:5501/product/?id=${widget.id}');
    http.Response res = await http.get(url);
    var decode = jsonDecode(res.body)[0];
    setState(() {
      data=decode;
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
    return Scaffold(

      appBar: AppBar(
        title: Text('Detels Pages'),
      ),
      body: SingleChildScrollView(
        child: data.isEmpty != true ?
        Center(
          child: Column(
            children:[
              Container(
                width: 200,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 10,
                  child:Image.network(data['image_url'],fit: BoxFit.cover,),),
              ),
              Text(data['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text(data['description'],style: TextStyle(color: Colors.grey[700]),),
              SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (){
                        if (conter>0){
                          setState(() {
                            conter -=1;
                          });
                        }
                      },
                      child: Container(
                    padding: EdgeInsets.all(3),
                    child: Icon(Icons.minimize),
                    decoration: BoxDecoration(
                      color: Colors.red
                    ),
                  )),
                  SizedBox(width: 20,),
                  Text('${conter}'),
                  SizedBox(width: 20,height: 10,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        conter +=1;
                      });
                    },
                      child: Container(
                    padding: EdgeInsets.all(3),
                    child: Icon(Icons.add),
                    decoration: BoxDecoration(

                        color: Colors.green
                    ),
                  ))
                ],
              ),
              SizedBox(height: 20,),
              Text(data['price'].toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),

            ]
          ),
        ):
        Text('Data Is isEmpty')
      )
    );
  }
}
