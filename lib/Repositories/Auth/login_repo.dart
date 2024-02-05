import 'dart:convert';
import 'package:code_school/Constants/const.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

import '../Storage/jwt_model.dart';

class LoginRepo{

  Future<void>login(String email,String password)async{
    final response=await http.post(
      Uri.parse("$authUrl/login"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if(response.statusCode==200){
      Map<String, dynamic> responseBody = json.decode(response.body);
      String token = responseBody['token'];
      var box = await Hive.openBox('jwt');
      JWTModel jwtModel = JWTModel(
          jwt: token
      );
      box.add(jwtModel);
      var item=box.values.toList();
      print(item[0].jwt);
      print('Token: $token');
    }
    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('response: ${response.body}');
    }
  }
}