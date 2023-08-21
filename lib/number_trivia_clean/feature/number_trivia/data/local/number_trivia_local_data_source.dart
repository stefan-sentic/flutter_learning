import 'dart:convert';

import 'package:learning/number_trivia_clean/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entity/number_trivia_raw.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaRaw> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaRaw triviaToCache);
}

const prefsKeyNumberTrivia = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberTriviaRaw> getLastNumberTrivia() {
    String? triviaJson = sharedPreferences.getString(prefsKeyNumberTrivia);
    if (triviaJson != null) {
      return Future.value(NumberTriviaRaw.fromJson(json.decode(triviaJson)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaRaw triviaToCache) async {
    sharedPreferences.setString(prefsKeyNumberTrivia, json.encode(triviaToCache.toJson()));
  }
}
