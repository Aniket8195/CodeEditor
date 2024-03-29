part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable{}

class HomeInitial extends HomeState {

  @override
  List<Object?> get props => [];
}
class Logout extends HomeState {

  @override
  List<Object?> get props => [];
}
class ErrorState extends HomeState {
  final String message;
  ErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
class LoadingState extends HomeState {

  @override
  List<Object?> get props => [];
}
class ProblemLoadedState extends HomeState {
  List<Problem>problems;
  ProblemLoadedState({required this.problems});
  @override
  List<Object?> get props => [];
}
