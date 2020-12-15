import 'dart:convert';

import 'package:bexture/models/userModels.dart';
import 'package:http/http.dart' as http;

getdata() async {
  List<Data> userModelList = [];
  String url = "https://reqres.in/api/users?page=1";

  var response = await http.get(url);
  var result = jsonDecode(response.body);

  print(result);
  for (var item in result["data"]) {
    Data data = Data(
      avatar: item["avatar"],
      id: item["id"],
      email: item["email"],
      firstName: item["first_name"],
      lastName: item["last_name"],
    );
    userModelList.add(data);
  }
  return userModelList;
}
