import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learning/number_trivia_clean/core/error/exception.dart';

import '../entity/number_trivia_raw.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaRaw> getConcreteNumberTrivia(int number);

  Future<NumberTriviaRaw> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;

  NumberTriviaRemoteDataSourceImpl({required this.client});

  @override
  Future<NumberTriviaRaw> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaRaw> getRandomNumberTrivia() =>
      _getTriviaFromUrl('http://numbersapi.com/random');

  Future<NumberTriviaRaw> _getTriviaFromUrl(String url) async {
    final http.Response response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Future.value(NumberTriviaRaw.fromJson(json.decode(response.body)));
    } else {
      throw ServerException();
    }
  }
}
