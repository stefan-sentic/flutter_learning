import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learning/number_trivia_clean/core/network/network_info.dart';
import 'package:learning/number_trivia_clean/core/util/input_converter.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/data/local/number_trivia_local_data_source.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/data/remote/number_trivia_remote_data_source.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/data/repository/number_trivia_repository_impl.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/repository/number_trivia_repository.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/usecase/get_concrete_number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/usecase/get_random_number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features

  // Bloc
  sl.registerFactory(
    () => NumberTriviaBloc(
      getConcreteNumberTrivia: sl(),
      getRandomNumberTrivia: sl(),
      inputConverter: sl(),
    ),
  );

  // UseCase
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(repository: sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(repository: sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}
