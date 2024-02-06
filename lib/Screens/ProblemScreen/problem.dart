import 'package:flutter/material.dart';
import '../../Models/problem_model.dart';

class ProblemSolve extends StatefulWidget {
  final Problem problem;
  const ProblemSolve({required this.problem,super.key});

  @override
  State<ProblemSolve> createState() => _ProblemSolveState();
}

class _ProblemSolveState extends State<ProblemSolve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solve Problem'),
      ),
     body: Center(
          child: Column(
            children: [
              Text(widget.problem.problem),
              Text(widget.problem.problemTitle),
            ],
          ),
        ),
    );
  }
}
