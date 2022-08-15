part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends AuthEvent {
  final LoginModel loginModel;

  LoginButtonPressed({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class Register extends AuthEvent {
  final LoginModel loginModel;

  Register({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}
