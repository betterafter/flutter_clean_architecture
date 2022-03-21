import 'package:untitled/domain/entity/UserEntity.dart';
import 'package:untitled/domain/repository/UserRepository.dart';

import '../../data/models/UserModel.dart';

class LoginUseCase {
  UserRepository userRepository;
  LoginUseCase({required this.userRepository});

  Future<UserEntity> logIn(String id, String pwd) {
    return userRepository.getUser(id, pwd);
  }
}