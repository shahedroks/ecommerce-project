import 'package:flutter/material.dart';
class TextControler extends StatelessWidget {
  const TextControler({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController id = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController rating = TextEditingController();
    TextEditingController description = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 5),
            child: TextField(
              controller: name,
              decoration: InputDecoration(hintText:'name',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1)
              ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2))
              ),
            ),
          ),Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: TextField(
              controller: price,
              decoration: InputDecoration(hintText:'price',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1)
                  ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2))
              ),
            ),
          ),Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: TextField(
              controller: rating,
              decoration: InputDecoration(hintText:'Rating',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1)
                  ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2))
              ),
            ),
          ),Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: TextField(
                controller: description,
                decoration: InputDecoration(hintText:'description',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(1)
                    ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(2))
                ),
              )
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green,shadowColor: Colors.yellow,elevation: 10,),
              child: Text('Submeat'))
        ],
      ),
    );
  }
}
