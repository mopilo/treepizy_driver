part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthState {}

class Loading extends AuthState {}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  Map? data;
  AuthSuccess(this.data);
}

class ValidatedOtp extends AuthState {}

class ResendOtp extends AuthState {
  Map? data;
  ResendOtp(this.data);
}

class UserModified extends AuthState {
  Map? data;
  UserModified(this.data);
}

class UserAvatarModified extends AuthState {
  Map? data;
  UserAvatarModified(this.data);
}

class PasswordModified extends AuthState {
  // Map? data;
  // PasswordModified(this.data);
}

class ResetSuccess extends AuthState {
  Map? data;
  ResetSuccess(this.data);
}

class Error extends AuthState {
  String error;

  Error(this.error);
}
