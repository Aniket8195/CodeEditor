import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../../../Repositories/Auth/signup_repo.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignUpRepo signUpRepo;
  SignupBloc(this.signUpRepo) : super(SignupInitial()) {
    on<SendOTPEvent>((event, emit)async {
      try {
        await signUpRepo.sendOTP(event.email);
        emit(SendOTPState());
      } catch (error) {
        emit(SignupErrorState("$error"));
      }
    });
    on<VerifyOTPEvent>((event, emit)async {
      try {
        emit(SubmitOTPState());
        await signUpRepo.signUP(
          event.name,
          event.email,
          event.password,
          event.username,
          event.confirmPass,
          event.otp,
        );
        emit(SignUPDoneState());
      } catch (error) {
        emit(SignupErrorState("$error"));
      }
    });


  }
}
