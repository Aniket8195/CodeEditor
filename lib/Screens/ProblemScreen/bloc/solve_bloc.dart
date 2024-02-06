import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_school/Repositories/Compiler/compile_repo.dart';
import 'package:meta/meta.dart';

part 'solve_event.dart';
part 'solve_state.dart';

class SolveBloc extends Bloc<SolveEvent, SolveState> {
  final CompileRepo read;
  SolveBloc(this.read) : super(SolveInitial()) {
    on<SolveEvent>((event, emit) {

    });
  }
}
