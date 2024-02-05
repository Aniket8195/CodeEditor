import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              TextField(
                controller: emailController,
                decoration:const InputDecoration(
                  labelText: "Email"
                ),
              ),
              TextField(
                 obscureText: true,
                controller: passController,
                decoration:const  InputDecoration(
                  labelText: "Password"
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              ElevatedButton(
                  onPressed: (){

                  },
                  child: const Text(
                    "Login"
                  ),
              ),
              ElevatedButton(
                  onPressed: (){
                    GoRouter.of(context).pushNamed("SignUp");
                  },
                  child: const Text("Sign Up")
              )
            ],
          ),
        ),
      )
    );
  }
}
