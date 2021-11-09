import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';

class loginAPI {
  Future<loginRespon> login(loginRequest requestModel) async {
    final response = await http.post(
        Uri.parse(
            "http://172.104.44.22/api/method/login?usr=Administrator&pwd=admin"),
        body: requestModel.toJson());
    if (response.statusCode == 200) {
      return loginRespon.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
