import 'package:get_it/get_it.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_tutorial/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:http/http.dart' as http;

import '../../src/authentication/data/datasources/authentication_remote_data_source.dart';
import '../../src/authentication/domain/usecases/get_user.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // App Logic
  sl.registerFactory(() => AuthenticationCubit(createUser: sl(), getUsers: sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImplementation(sl()));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthRemoteDataSrcImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
}
