import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class GetDataProvider extends ChangeNotifier{
  List data = [];

  GetData () async {
    var url = Uri.parse('http://68.178.163.174:5501/product');
    http.Response res = await http.get(url);
    var decode= jsonDecode(res.body);
    decode= data;
    notifyListeners();
  }

  static GetDataProvider of(BuildContext context, {bool listen = true}) {
return Provider.of<GetDataProvider>(context, listen: listen);
  }
}