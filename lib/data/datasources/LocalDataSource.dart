import '../models/UserModel.dart';

abstract class LocalDataSource {
  Future<UserModel> getUser(String id, String pwd);
}