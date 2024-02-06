import 'package:code_school/Screens/HomeScreen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../Models/problem_model.dart';
import '../Repositories/Auth/login_repo.dart';
import '../Repositories/Auth/signup_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../Repositories/Compiler/compile_repo.dart';
import '../Repositories/Problems/problems_repo.dart';
import '../Screens/HomeScreen/bloc/home_bloc.dart';
import '../Screens/Login/bloc/login_bloc.dart';
import '../Screens/Login/login_screen.dart';
import '../Screens/ProblemScreen/bloc/solve_bloc.dart';
import '../Screens/ProblemScreen/problem.dart';
import '../Screens/SignUp/bloc/signup_bloc.dart';
import '../Screens/SignUp/signUp_screen.dart';
import 'error_page.dart';

class MyRouter{

  RouteInformationProvider routeInformationProvider(BuildContext context) {
    return router.routeInformationProvider;
  }

  routeInformationParser(BuildContext context, RouteInformation routeInformation) {
    return router.routeInformationParser;
  }

  GoRouter router=GoRouter(
      routes:
      <RouteBase>[
         GoRoute(
           name: "SignUp",
             path:"/SignUp",
           builder:(BuildContext context,GoRouterState state){
             return RepositoryProvider(
               create: (context)=>SignUpRepo(),
               child: BlocProvider(
                 create: (context)=>SignupBloc(context.read<SignUpRepo>()),
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
              create: (context)=>LoginBloc(context.read<LoginRepo>()),
              child: const LoginScreen(),
            ),
          );
        }
    ),
    GoRoute(
        name: "Home",
        path:"/Home",
        builder:(BuildContext context,GoRouterState state){
          return RepositoryProvider(
            create: (context)=>ProblemRepo(),
            child: BlocProvider(
              create: (context)=>HomeBloc(context.read<ProblemRepo>()),
              child: const HomePage(),
            ),
          );
        }
    ),
        GoRoute(
            name: "ProblemSolve",
            path:"/ProblemSolve",
            builder:(BuildContext context,GoRouterState state){
              return RepositoryProvider(
                create: (context)=>CompileRepo(),
                child: BlocProvider(
                  create: (context)=>SolveBloc(context.read<CompileRepo>()),
                  child: ProblemSolve(problem: state.extra! as Problem,),
                ),
              );
            }
        ),

  ],
          errorBuilder: (context,state){
           return const ErrorPage();
          },
          redirect: (context,state)async{
            var box = await Hive.openBox('jwt');
            var item = box.values.toList();

            if (item.isNotEmpty) {
              var isLoggedIn = item[0].jwt != null;

              if (isLoggedIn) {
                return '/Home';
              } else {
                return '/';
              }
            } else {
              return '/';
            }
      }

  );
}