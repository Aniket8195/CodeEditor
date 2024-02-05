import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Repositories/Problems/problems_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProblemRepo problemRepo;
  HomeBloc(this.problemRepo) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
