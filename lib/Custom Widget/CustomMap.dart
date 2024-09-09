import 'package:ecommars/Function/GetData.dart';
import 'package:flutter/material.dart';
class Custommap extends StatelessWidget {
  String? image_url;
  int? id;
  String? name;
  int? rating;
  int? price;
  String? description;

  Custommap({super.key,this.image_url,this.id,this.name,this.rating,this.price,this.description,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2,),
      decoration: BoxDecoration(color: Color(0xffFDE992)),


      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Container(
               // margin: EdgeInsets.all(1),
               width: double.infinity,
               height: 200,
               child: Card(
                         semanticContainer: true,
                         clipBehavior: Clip.antiAliasWithSaveLayer,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                 child: Image.network('${image_url}',fit: BoxFit.fill),
                           ),
             ),
          Row(
            children: [Text('${name}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             Spacer(),
              Text('Tk${price}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),],
          ),
          Text('${description}',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey[700]),),
          Text('${rating} '),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
