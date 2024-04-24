import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:live_project_bloc_firebase/data/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<RequestGoogleLoginEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());
        final user = await _authRepository.signInWithGoogle();
        debugPrint('User: ${user?.displayName}');
        emit(LoginSuccessState());
      } on Exception catch (e) {
        debugPrint(e.toString());
        emit(LoginErrorState(messageError: e.toString()));
      }
    });

    on<RequestGitHubLoginEvent>((event, emit) async {});
  }
}
