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

class ModifyAvatarEvent extends AuthEvent {
  final file;

  ModifyAvatarEvent({required this.file});

  @override
  List<Object> get props => [file];
}

class UploadEvent extends AuthEvent {
  final file;
  final String id;

  UploadEvent({required this.file, required this.id});

  @override
  List<Object> get props => [file, id];
}

class ModifyUserEvent extends AuthEvent {
  final ModifyUserModel modifyUserModel;

  ModifyUserEvent({required this.modifyUserModel});

  @override
  List<Object> get props => [modifyUserModel];
}

class ResendOtpEvent extends AuthEvent {
  ResendOtpEvent();

  @override
  List<Object> get props => [];
}

class OtpEvent extends AuthEvent {
  final String otp;

  OtpEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}

class ResetPasswordEvent extends AuthEvent {
  final String tel;

  ResetPasswordEvent({required this.tel});

  @override
  List<Object> get props => [tel];
}

class ChangePasswordEvent extends AuthEvent {
  final ChangePasswordModel changePasswordModel;

  ChangePasswordEvent({required this.changePasswordModel});

  @override
  List<Object> get props => [changePasswordModel];
}
