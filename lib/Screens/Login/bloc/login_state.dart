part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{
}

class LoginInitial extends LoginState {

  @override
  List<Object?> get props => [];
}
class LoginLoadingState extends LoginState {

  @override
  List<Object?> get props => [];
}
class LoginDoneState extends LoginState {

  @override
  List<Object?> get props => [];
}
class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState({required this.message});
  @override
  List<Object?> get props => [];
}
