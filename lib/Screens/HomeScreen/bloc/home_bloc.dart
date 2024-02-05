import 'package:bloc/bloc.dart';
import 'package:code_school/Screens/HomeScreen/logout.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../Models/problem_model.dart';
import '../../../Repositories/Problems/problems_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProblemRepo problemRepo;
  HomeBloc(this.problemRepo) : super(HomeInitial()) {
    on<LoadingEvent>((event, emit)async {
          try{
            emit(LoadingState());
            List<Problem>problems=await problemRepo.getProblems();
            emit(ProblemLoadedState(problems: problems));
          }catch(error){
            emit(ErrorState(message: error.toString()));
          }
    });
    on<LogoutEvent>((event, emit)async {
      try{
        logoutM();
        emit(Logout());
      }catch(error){
        emit(ErrorState(message: error.toString()));
      }

    });
  }
}
