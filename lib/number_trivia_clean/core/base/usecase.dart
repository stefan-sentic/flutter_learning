import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class UseCase<R> {
  Future<Either<Failure, R>> call();
}
