import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'bloc/signup_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            if(state is SendOTPState){
              return SizedBox(

                child: AlertDialog(
                  title: const Text('Enter OTP'),
                  content:  OtpTextField(
                    numberOfFields: 6,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onSubmit: (String verificationCode){
                      context.read<SignupBloc>().add(
                        VerifyOTPEvent(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
                          confirmPass: confirmPasswordController.text,
                          otp: verificationCode,
                        ),
                      );
                    },
                  ),
                ),
              );

            }
            if(state is SubmitOTPState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is SignUPDoneState){
              GoRouter.of(context).go('/Login');
              return Container();
            }
            if (state is SignupErrorState) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(state.error),
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
              return SingleChildScrollView(
                child: Column(
                
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name',),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    TextField(
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                          labelText: 'Confirm Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                            context.read<SignupBloc>().add(
                          SendOTPEvent(email:emailController.text,),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed("Login");
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),

    );
  }
}
