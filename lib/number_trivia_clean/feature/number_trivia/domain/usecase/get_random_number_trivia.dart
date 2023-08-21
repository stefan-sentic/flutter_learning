import 'package:dartz/dartz.dart';
import 'package:learning/number_trivia_clean/core/base/usecase.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/model/number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/repository/number_trivia_repository.dart';

import '../../../../core/error/failure.dart';

class GetRandomNumberTrivia extends UseCase<NumberTrivia> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call() {
    return repository.getRandomNumberTrivia();
  }
}
