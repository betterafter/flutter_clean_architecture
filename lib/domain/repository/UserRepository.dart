import '../../data/models/UserModel.dart';

abstract class UserRepository {
  Future<UserModel> getUser(String id, String pwd);
}