import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:list_items/login_page/model/login_model.dart';
import 'package:list_items/main_page/model/item.dart';

class loginAPI {
  Future<loginRespon> login(loginRequest requestModel) async {
    final response = await http.post(
      Uri.parse(
          "http://172.104.44.22/api/method/login?usr=Administrator&pwd=admin"), /*body: requestModel.toJson()*/
    );
    if (response.statusCode == 200) {
      return loginRespon.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class listBarangApi {
  static Future<List<listBarang>> getlistBarang() async {
    final response = await http.get(Uri.parse(
        'http://172.104.44.22/api/resource/Item?fields=["item_code", "item_name","image","normal_rate","promo_rate"]&filters=[["Item","item_group","=","Products"]]'));

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return listBarang.listBarangFromSnapshot(_temp);
  }
}
