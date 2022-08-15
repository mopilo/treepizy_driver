part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthState {}

class Loading extends AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class Error extends AuthState {
  String error;

  Error(this.error);
}
