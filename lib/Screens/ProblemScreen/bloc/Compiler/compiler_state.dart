part of 'compiler_bloc.dart';

@immutable
abstract class CompilerState extends Equatable{}

class CompilerInitial extends CompilerState {

  @override
  List<Object> get props => [];
}
class CompilerSubmitState extends CompilerState {

  @override
  List<Object> get props => [];
}
class CompilerDone extends CompilerState {
 final List<TestCase>testCases;
 final List<bool> testCaseResults;
  CompilerDone({required this.testCases,required this.testCaseResults});
  @override
  List<Object> get props => [testCases,testCaseResults];
}
class CompilerError extends CompilerState {
  final String message;
  CompilerError({required this.message});
  @override
  List<Object> get props => [message];
}