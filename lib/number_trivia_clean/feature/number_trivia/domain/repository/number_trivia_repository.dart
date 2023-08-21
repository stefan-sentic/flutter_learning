import 'package:dartz/dartz.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/model/number_trivia.dart';

import '../../../../core/error/failure.dart';

abstract class NumberTriviaRepository {

  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
