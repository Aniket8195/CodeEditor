part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{}

class CheckLoginEvent extends LoginEvent{
   final String email;
   final String password;
   CheckLoginEvent({required this.email,required this.password});
  @override
  List<Object?> get props => [];
}
class LoginDoneEvent extends LoginEvent{
 final String jWT;
 LoginDoneEvent({required this.jWT});
  @override
  List<Object?> get props => [jWT];
}