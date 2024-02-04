import 'package:code_school/Screens/Login/login_screen.dart';
import 'package:code_school/Screens/SignUp/signUp_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route? onGenerateRoute(RouteSettings settings){
      switch(settings.name){
        case '/login':return(
        MaterialPageRoute(builder: (context)=>const LoginScreen())
        );
        case '/signUp':return(
         MaterialPageRoute(builder: (context)=>const SignUpScreen())
        );
        default:return null;
      }
  }
}