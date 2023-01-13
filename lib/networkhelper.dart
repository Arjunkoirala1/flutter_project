import 'dart:convert';
import 'dart:io';
import 'package:my_firstapp/getpost.dart';
import 'package:my_firstapp/loginmodel.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var body = response.body;
      return postsFromJson(body);
    }
  }

  Future<Login> getLogin({
    var phone,
    var password,
  }) async {
    var client = http.Client();
    var loginmodel;

    var uri = Uri.parse(
        'http://103.38.197.18/mobilebanking/api/v2/mdabaliReportUserLogin');
    var response = await client.post(
      uri,
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode(
        <dynamic, dynamic>{
          "mobileno": phone,
          "password": password,
        },
      ),
    );

    if (response.statusCode == 200) {
      var body = response.body;
      var jsonMap = jsonDecode(body);
      loginmodel = Login.fromJson(jsonMap);
    }
    return loginmodel;
  }
}
