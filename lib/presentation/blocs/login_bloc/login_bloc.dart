import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:untitled/domain/repository/UserRepository.dart';
import 'package:untitled/domain/usecases/LoginUseCase.dart';

import '../../../data/models/UserModel.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<ButtonPressedEvent>(_mapGetNoticeEventToState);
  }

  Future<void> _mapGetNoticeEventToState(
      ButtonPressedEvent event, Emitter<LoginState> emit) async {
    try {
       emit(LoginProgress());

      final user = await loginUseCase.userRepository.getUser(event.id, event.pwd);

       emit(LoginSuccess(user: user));
    } catch (e) {
      emit(LoginFail(msg: e.toString()));
    }
  }
}
