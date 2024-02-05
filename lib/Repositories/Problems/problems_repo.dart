import 'dart:convert';

import 'package:code_school/Models/problem_model.dart';
import 'package:code_school/Constants/const.dart';
import 'package:http/http.dart' as http;
class ProblemRepo{
   Future<List<Problem>> getProblems()async{
         final response=await http.get(
           Uri.parse("$problemUrl/showallproblem")
         );
         if(response.statusCode!=200){
           print(response.body);
           throw Exception('response: ${response.body}');
         }
         final dynamic decodedResponse = jsonDecode(response.body);
         if (decodedResponse['data'] != null) {
           List<dynamic> problemData = decodedResponse['data'];
           List<Problem> problemList = problemData.map((problem) => Problem.fromJson(problem)).toList();
           print(problemList);
           print(problemList[0].problem);
           return problemList;
         }else{
           throw Exception('Invalid response format');
         }

   }
}