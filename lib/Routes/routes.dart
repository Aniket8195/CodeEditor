import 'package:flutter/material.dart';
import '../Repositories/Auth/login_repo.dart';
import '../Repositories/Auth/signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../Screens/Login/bloc/login_bloc.dart';
import '../Screens/Login/login_screen.dart';
import '../Screens/SignUp/bloc/signup_bloc.dart';
import '../Screens/SignUp/signUp_screen.dart';

class MyRouter{
  // final GlobalKey<NavigatorState> _rootNavigatorKey =
  // GlobalKey<NavigatorState>();
  GoRouter router=GoRouter(
      routes:
  [
         GoRoute(
           name: "SignUp",
             path:"/SignUp",
           builder:(BuildContext context,GoRouterState state){
             return RepositoryProvider(
               create: (context)=>SignUpRepo(),
               child: BlocProvider(
                 create: (context)=>SignupBloc(),
                 child: const SignUpScreen(),
               ),
             );
           }
           ),

    GoRoute(
        name: "Login",
        path:"/",
        builder:(BuildContext context,GoRouterState state){
          return RepositoryProvider(
            create: (context)=>LoginRepo(),
            child: BlocProvider(
              create: (context)=>LoginBloc(),
              child: const LoginScreen(),
            ),
          );
        }
    ),


  ]

  );
}