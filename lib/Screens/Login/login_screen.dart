import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/login_bloc.dart';

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
      body:BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
         if(state is LoginInitial){
           return SingleChildScrollView(
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
                       context.read<LoginBloc>().add(CheckLoginEvent(
                         email: emailController.text,
                         password: passController.text
                       ));
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
           );
         }
         if(state is LoginDoneState){
           Future.delayed(const Duration(milliseconds: 100), () {
             GoRouter.of(context).pushReplacementNamed("Home");
           });

           return Container();
         }
         if(state is LoginLoadingState){
           return const Center(
             child: CircularProgressIndicator(),
           );
         }
         if(state is LoginErrorState){
           return AlertDialog(
             title: const Text('Error'),
             content: Text(state.message),
             actions: [
               TextButton(
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
                 child: const Text('OK'),
               ),
             ],
           );
         }
         else{
           return const Center(
             child: Text("Error"),
           );
         }
    },
    )
    );
  }
}
