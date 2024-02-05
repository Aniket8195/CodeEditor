import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../Repositories/Auth/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;
  LoginBloc(this.loginRepo) : super(LoginInitial()) {
    on<CheckLoginEvent>((event, emit)async {
      try{
        emit(LoginLoadingState());
        await loginRepo.login(event.email, event.password);
        emit(LoginDoneState());
      }catch(e){
        emit(LoginErrorState(message: e.toString()));
      }
    });
  }
}
