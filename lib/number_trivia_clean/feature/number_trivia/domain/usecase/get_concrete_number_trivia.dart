import 'package:dartz/dartz.dart';
import 'package:learning/number_trivia_clean/core/base/param_usecase.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/model/number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/repository/number_trivia_repository.dart';

import '../../../../core/error/failure.dart';

class GetConcreteNumberTrivia extends ParamsUseCase<Params, NumberTrivia> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) {
    return repository.getConcreteNumberTrivia(params.number);
  }
}

class Params {
  final int number;

  const Params({required this.number});
}
