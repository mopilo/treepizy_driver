import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treepizy_driver/core/data/session_manager.dart';
import 'package:treepizy_driver/core/routing/compass.dart';
import 'package:treepizy_driver/features/auth/presentation/screens/welcome_back/welcome_screen.dart';
import 'package:injectable/injectable.dart';
import 'package:treepizy_driver/features/onboarding/screen/onboarding1.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  final Compass _compass;

  SplashCubit(this._compass) : super(SplashInitialState()) {
    _checkAuthorization();
  }

  Future<void> _checkAuthorization() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashCompletedState());
    SessionManager.instance.isOnBoarding
        ? _compass.replace(WelcomeScreenRoute())
        : _compass.replace(OnBoardingFirstScreenRoute());
  }
}

@immutable
abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashCompletedState extends SplashState {}
