import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Code School"),
        actions: [
          IconButton(
              onPressed: () {
                context.read<HomeBloc>().add(LogoutEvent());
              },
              icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
              if(state is HomeInitial){
                return const Column(
                    children: [
                Center(
                child: Text(
                "Home"
                ),
                ),
          ],
          );
              }
              if(state is Logout){
                Future.delayed(const Duration(milliseconds: 100), () {
                  GoRouter.of(context).pushReplacementNamed("Login");
                });
                return Container();
              }
              if(state is ErrorState){
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
      ),

    );
  }
}
