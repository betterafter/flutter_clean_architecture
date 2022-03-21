import 'package:untitled/data/datasources/LocalDataSource.dart';
import 'package:untitled/data/datasources/RemoteDataSource.dart';
import 'package:untitled/domain/repository/UserRepository.dart';

import '../models/UserModel.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDatasource remoteDatasource;
  final LocalDataSource localDataSource;

  UserRepositoryImpl({required this.remoteDatasource, required this.localDataSource });

  @override
  Future<UserModel> getUser(String id, String pwd) {
    return localDataSource.getUser(id, pwd);
  }
}