import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treepizy_driver/features/auth/data/datasource/auth_service.dart';

import '../../data/model/login_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  AuthBloc(this._authService) : super(AuthInitial()) {
    // on<LoginButtonPressed>(login);
    on<Register>(register);
  }

  // Future<void> login(LoginButtonPressed event, Emitter<AuthState> emit) async {
  //   emit(LoginLoading());
  //   (await _authService.login(event.loginModel)).fold(
  //       (error) => emit(Error(error.toString())),
  //       (success) => emit(AuthSuccess()));
  // }

  Future<void> register(Register event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    (await _authService.register(event.loginModel)).fold(
        (error) => emit(Error(error.toString())),
        (success) => emit(AuthSuccess()));
  }
}
