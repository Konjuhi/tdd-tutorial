import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import '../../../../core/utils/typedef.dart';

// abstract class AuthenticationRepository {
//   const AuthenticationRepository();
//
//   Future<Either<Failure, void>> createUser({
//     required String createdAt,
//     required String name,
//     required String avatar,
//   });
//
//   Future<Either<Failure, List<User>>> getUsers();
// }
abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUsers();
}
