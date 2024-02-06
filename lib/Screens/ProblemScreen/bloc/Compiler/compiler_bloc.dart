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
    on<CompilerSubmit>((event, emit) {
       emit(CompilerSubmitState());
        try {
          if(event.problem.testCases.isNotEmpty){
            List<bool>res=[];
            for(int i=0;i<event.problem.testCases.length;i++){
              compileCode(event.problem.testCases[i].input,event.problem.testCases[i].output,event.language,event.code).then((value) {
                res.add(value);
              });
            }
            emit(CompilerDone(testCases:event.problem.testCases,testCaseResults:res));
          }else{
           emit(CompilerError(message:"List is empty"));
          }
        }catch(error){
          emit(CompilerError(message:error.toString()));
        }
    });
  }
  Future<bool>compileCode(String input,String output,String language,String code)async{
    bool res=false;
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
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if(responseBody['message']==output){
          res=true;
          print(res);
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
