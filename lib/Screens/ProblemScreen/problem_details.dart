import 'package:code_school/Models/problem_model.dart';
import 'package:flutter/cupertino.dart';

Widget showProblem(Problem problem){
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(problem.problemTitle,style:const  TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text(problem.problem),
          const SizedBox(height: 10),
          const Text(
            'Sample Test Cases:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: problem.sampleTestCases.map((testCase) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Input: ${testCase.input}'),
                  Text('Output: ${testCase.output}'),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          const Text(
            'Test Cases:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: problem.testCases.map((testCase) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Input: ${testCase.input}'),
                  Text('Output: ${testCase.output}'),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          ),

        ],
      ),
    ),
  );
}
