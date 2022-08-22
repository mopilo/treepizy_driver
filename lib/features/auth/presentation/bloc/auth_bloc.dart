import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treepizy_driver/features/auth/data/datasource/auth_service.dart';
import 'package:treepizy_driver/features/auth/data/model/change_password_model.dart';
import 'package:treepizy_driver/features/auth/data/model/modify_user_model.dart';

import '../../data/model/login_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  AuthBloc(this._authService) : super(AuthInitial()) {
    on<LoginButtonPressed>(login);
    on<Register>(register);
    on<ChangePasswordEvent>(changePassword);
    on<ResetPasswordEvent>(resetPassword);
    on<OtpEvent>(verifyOtp);
    on<ResendOtpEvent>(resendOtp);
    on<ModifyUserEvent>(modifyUser);
    on<UploadEvent>(uploadDoc);

  }

  Future<void> login(LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    (await _authService.login(event.loginModel)).fold(
        (error) => emit(Error(error.toString())),
        (success) => emit(AuthSuccess(success)));
  }

  Future<void> register(Register event, Emitter<AuthState> emit) async {
    emit(Loading());
    (await _authService.register(event.loginModel)).fold(
        (error) => emit(Error(error.toString())),
        (success) => emit(AuthSuccess(success)));
  }


   Future<void>  changePassword(ChangePasswordEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
    (await _authService.changePassword(event.changePasswordModel)).fold(
      (error) => emit(Error(error.toString())),
      (list) => emit(PasswordModified()),
    );
  }

   Future<void>  resetPassword(
      ResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
    (await _authService.resetPassword(event.tel)).fold(
      (error) => emit(Error(error.toString())),
      (data) => emit(ResetSuccess(data)),
    );
  }

   Future<void>  verifyOtp(
      OtpEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
    (await _authService.otpValidation(event.otp)).fold(
      (error) => emit(Error(error.toString())),
      (list) => emit(ValidatedOtp()),
    );
  }

   Future<void>  resendOtp(
      ResendOtpEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
    (await _authService.resendOtp()).fold(
      (error) => emit(Error(error.toString())),
      (data) => emit(ResendOtp(data)),
    );
  }

  void modifyUser(ModifyUserEvent event, Emitter<AuthState> emit) async {
    emit(Loading());
    (await _authService.modifyUser(event.modifyUserModel)).fold(
      (error) => emit(Error(error.toString())),
      (data) => emit(UserModified(data)),
    );
  }

  Future<void> modifyAvatar(
      ModifyAvatarEvent event, Emitter<AuthState> emit) async {
    // emit(Loading());
    (await _authService.modifyUserAvatar(event.file)).fold(
        (error) => emit(Error(error.toString())),
      (data) => emit(UserAvatarModified(data)),
    );
  }

  Future<void> uploadDoc(
      UploadEvent event, Emitter<AuthState> emit) async {
    // emit(Loading());
    (await _authService.uploadCertificate(event.file, event.id)).fold(
      (error) => emit(Error(error.toString())),
      (data) => emit(UserAvatarModified(data)),
    );
  }
}
