import 'package:untitled/domain/entity/UserEntity.dart';

class UserModel extends UserEntity {

  UserModel({required String id, required String pwd, required String name})
      : super(id: id, pwd: pwd, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], pwd: json['pwd'], name: json['name']);
  }
}
