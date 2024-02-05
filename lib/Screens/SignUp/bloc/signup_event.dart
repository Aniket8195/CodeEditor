part of 'signup_bloc.dart';


@immutable
abstract class SignupEvent extends Equatable{

}
class SendOTPEvent extends SignupEvent{
  final String email;
  SendOTPEvent({required this.email});
  @override
  List<Object?> get props => [email];

}
class VerifyOTPEvent extends SignupEvent{
   final String name;
   final String email;
  final String password;
  final String username;
  final String confirmPass;
  final String otp;
  VerifyOTPEvent({required this.name,required this.email,required this.password,required this.username,required this.confirmPass,required this.otp});
  @override
  List<Object?> get props => [name,email,password,username,confirmPass,otp];

}
