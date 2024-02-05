part of 'signup_bloc.dart';

@immutable
abstract class SignupState extends Equatable{}

class SignupInitial extends SignupState {

  @override
  List<Object?> get props => [];
}
class SendOTPState extends SignupState{

  @override
  List<Object?> get props => [];

}
class SubmitOTPState extends SignupState{

  @override
  List<Object?> get props => [];

}
class SignUPDoneState extends SignupState{


  @override
  List<Object?> get props => [];

}
class SignUPLoadingState extends SignupState{


  @override
  List<Object?> get props => [];

}
class SignupErrorState extends SignupState{
  final String error;
  SignupErrorState(this.error);

  @override
  List<Object?> get props => [error];

}
