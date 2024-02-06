import 'package:code_school/Screens/ProblemScreen/bloc/Compiler/compiler_bloc.dart';
import 'package:code_school/Screens/ProblemScreen/problem_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/problem_model.dart';
import 'code_section.dart';

class ProblemSolve extends StatefulWidget {
  final Problem problem;

  const ProblemSolve({required this.problem, super.key});

  @override
  State<ProblemSolve> createState() => _ProblemSolveState();
}

class _ProblemSolveState extends State<ProblemSolve> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Solve Problem'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Problem',
                ),
                Tab(
                  text: 'Code',
                ),
              ],

            ),
          ),
          body: TabBarView(
            children: [
              showProblem(widget.problem),
              BlocProvider(
                create: (context) => CompilerBloc(),
                child: CodeScreen(problem: widget.problem),
              ),
            ],
          )
      ),
    );
  }
}
