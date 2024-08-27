import 'package:http/http.dart'as http;

void deletData (id,getdata)async {
  var uri = Uri.parse('http://68.178.163.174:5501/product/delete?id=${id}');
  http.Response res = await http.delete(uri);
getdata;
}
void addfile () async {
  var request = http.MultipartRequest('POST', Uri.parse('http://68.178.163.174:5501/product/add'));
  request.files.add(await http.MultipartFile.fromPath(field, filePath))

}