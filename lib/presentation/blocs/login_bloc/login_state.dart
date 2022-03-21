part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginProgress extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFail extends LoginState {
  final String msg;
  LoginFail({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess({required this.user});
  @override
  List<Object?> get props => [user];
}
