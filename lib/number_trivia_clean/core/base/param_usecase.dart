import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class ParamsUseCase<P, R> {
  Future<Either<Failure, R>> call(P params);
}
