import 'package:dartz/dartz.dart';
import 'package:learning/number_trivia_clean/core/error/exception.dart';
import 'package:learning/number_trivia_clean/core/error/failure.dart';
import 'package:learning/number_trivia_clean/core/network/network_info.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/data/remote/number_trivia_remote_data_source.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/model/number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/repository/number_trivia_repository.dart';

import '../entity/number_trivia_raw.dart';
import '../local/number_trivia_local_data_source.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    return _getTrivia(() => remoteDataSource.getConcreteNumberTrivia(number));
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return _getTrivia(remoteDataSource.getRandomNumberTrivia);
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
    Future<NumberTriviaRaw> Function() networkCall,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await networkCall();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return const Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return const Left(CacheFailure());
      }
    }
  }
}
