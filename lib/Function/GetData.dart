import 'package:http/http.dart'as http;

void deletData (id,GetData)async {
  var uri = Uri.parse('http://68.178.163.174:5501/product/delete?id=${id}');
  http.Response res = await http.delete(uri);
GetData();
}



