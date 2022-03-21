part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {

}

class ButtonPressedEvent extends LoginEvent {
  final String id, pwd;
  ButtonPressedEvent({required this.id, required this.pwd});

  @override
  String toString() {
    return 'id : $id, pwd : $pwd';
  }

  @override
  List<Object?> get props => [id, pwd];
}


