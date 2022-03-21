import 'package:get_it/get_it.dart';
import 'package:untitled/data/datasources/LocalDataSource.dart';
import 'package:untitled/data/datasources/LocalDataSourceImpl.dart';
import 'package:untitled/data/datasources/RemoteDataSource.dart';
import 'package:untitled/data/datasources/RemoteDataSourceImpl.dart';
import 'package:untitled/data/repository/UserRepositoryImpl.dart';
import 'package:untitled/domain/repository/UserRepository.dart';
import 'package:untitled/domain/usecases/LoginUseCase.dart';
import 'package:untitled/presentation/blocs/login_bloc/login_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  di.registerFactory(() => LoginBloc(loginUseCase: di()));

  di.registerLazySingleton(() => LoginUseCase(userRepository: di()));

  di.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDatasource: di(), localDataSource: di()));

  di.registerLazySingleton<RemoteDatasource>(() => RemoteDataSourceImpl());
  di.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
