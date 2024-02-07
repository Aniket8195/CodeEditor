import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Repositories/Compiler/compile_repo.dart';
import '../ProblemScreen/bloc/solve_bloc.dart';
import '../ProblemScreen/problem.dart';
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
        automaticallyImplyLeading: false,
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
          if (state is ProblemLoadedState) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount:state.problems.length,
                        itemBuilder:(context,index){
                          return Card(
                            child: ListTile(
                                leading: const Icon(Icons.code_outlined),
                                trailing: FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RepositoryProvider(
                                          create: (context) => CompileRepo(),
                                          child: BlocProvider(
                                            create: (context) =>
                                                SolveBloc(context.read<CompileRepo>()),
                                            child: ProblemSolve(problem: state.problems[index]),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                             RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5.0),

                                            )
                                        )
                                    ),
                                  child: const Text('Solve'),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.problems[index].problemTitle,style: const TextStyle(fontWeight: FontWeight.bold),),
                                    Text(
                                      state.problems[index].problem,
                                    ),
                                  ],
                                )
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            );
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Logout) {
           GoRouter.of(context).pushReplacementNamed("Login");
            return Container();
          }
          if (state is ErrorState) {
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
          else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),

    );
  }
}
