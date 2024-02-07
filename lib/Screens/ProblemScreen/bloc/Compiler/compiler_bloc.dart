import 'dart:async';
import 'package:code_school/Constants/const.dart';
import 'package:bloc/bloc.dart';
import 'package:code_school/Models/problem_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'compiler_event.dart';
part 'compiler_state.dart';

class CompilerBloc extends Bloc<CompilerEvent, CompilerState> {
  CompilerBloc() : super(CompilerInitial()) {
    on<CompilerSubmit>((event, emit) async {
       emit(CompilerSubmitState());
        try {
          // if(event.problem.testCases.isNotEmpty){
          //   List<bool>res=[];
          //   for(int i=0;i<event.problem.testCases.length;i++){
          //     compileCode(event.problem.testCases[i].input,event.problem.testCases[i].output,event.language,event.code).then((value) {
          //       res.add(value);
          //     });
          //   }
          //   emit(CompilerDone(testCases:event.problem.testCases,testCaseResults:res));
          // }else{
          //  emit(CompilerError(message:"List is empty"));
          // }
          if (event.problem.testCases.isNotEmpty) {
            List<bool> testResults = [];
            for (final testCase in event.problem.testCases) {
              final result = await compileCode(
                testCase.input,
                testCase.output,
                event.language,
                event.code,
              );
              testResults.add(result);
            }
            emit(CompilerDone(
              testCases: event.problem.testCases,
              testCaseResults: testResults,
            ));
          }else {
            emit(CompilerError(message: "List is empty"));
          }
        }catch(error){
          emit(CompilerError(message:error.toString()));
        }
    });
  }
  Future<bool>compileCode(String input,String output,String language,String code)async{
    bool res=false;
    print("Compiling code for input: $input");
    Map<String, dynamic> requestBody = {
      "code": code,
      "input": input,
      "language": language,
    };
    try{
      final response = await http.post(
        Uri.parse(compileUrl),
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        String extractedOutput = responseBody['message'].split(" '")[1].split("'\r\n")[0];
        if(extractedOutput==output){
          res=true;
          print("Test case passed for input: $input");
          print(res);
        }else{
          print("Test case failed for input: $input");
        }
      } else {
        throw Exception('Failed to compile code: ${response.statusCode}');
      }
    }catch(err){
      throw Exception(err);
    }

    return res;
  }
}
