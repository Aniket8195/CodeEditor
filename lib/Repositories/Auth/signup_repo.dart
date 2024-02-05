import 'dart:convert';
import 'package:code_school/Constants/const.dart';
import 'package:http/http.dart' as http;
class SignUpRepo{

  Future<void>sendOTP(String email)async{
    print(email);
    final response=await http.post(
      Uri.parse("$authUrl/sendotp"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
      }),

    );
    if (response.statusCode != 200) {
      throw Exception('response: ${response.body}');
    }
  }
  Future<void>signUP(String name,String email,String password,String username,String confirmPass,String otp)async{
        final response=await http.post(
          Uri.parse("$authUrl/signup"),
          body: jsonEncode(
            {
              'name':name,
              'email':email,
              'username':username,
              'password':password,
              'confirmPassword':confirmPass,
              'otp':otp
            }
          ),
        );
        if (response.statusCode != 200) {
          throw Exception('response: ${response.body}');
        }
  }
}