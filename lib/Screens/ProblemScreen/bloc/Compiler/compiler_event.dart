part of 'compiler_bloc.dart';

@immutable
abstract class CompilerEvent extends Equatable{}

class CompilerInitialEvent extends CompilerEvent {
  @override
  List<Object> get props => [];
}
class CompilerSubmit extends CompilerEvent {
  final Problem problem;
  final String language;
  final String code;
  CompilerSubmit({required this.problem,required this.language,required this.code});
  @override
  List<Object> get props => [problem,language,code];
}


