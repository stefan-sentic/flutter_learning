import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/number_trivia_clean/core/error/failure.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/model/number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/usecase/get_concrete_number_trivia.dart';
import 'package:learning/number_trivia_clean/feature/number_trivia/domain/usecase/get_random_number_trivia.dart';

import '../../../../core/util/input_converter.dart';

part './number_trivia_state.dart';

part 'number_trivia_event.dart';

class ErrorMessage {
  static const String serverError = 'Server failure';
  static const String cacheError = 'Cache failure';
  static const String invalidInput = 'The number must be a positive integer or zero';
}

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(const Empty()) {
    on<NumberTriviaEvent>((event, emit) async {
      return switch (event) {
        GetTriviaForConcreteNumberEvent() => onConcreteNumberTriviaEvent(event.numberString, emit),
        GetTriviaForRandomNumberEvent() => onRandomNumberTriviaEvent(emit),
      };
    });
  }

  Future<void> onConcreteNumberTriviaEvent(String numberString, Emitter<NumberTriviaState> emit) async {
    await inputConverter.stringToUnsignedInteger(numberString).fold(
      (failure) {
        emit(const Error(ErrorMessage.invalidInput));
      },
      (data) async {
        emit(const Loading());
        (await getConcreteNumberTrivia(Params(number: data))).fold(
          (failure) => emit(Error(_mapFailureToErrorMessage(failure))),
          (data) => emit(Data(data)),
        );
      },
    );
  }

  Future<void> onRandomNumberTriviaEvent(Emitter<NumberTriviaState> emit) async {
    emit(const Loading());
    (await getRandomNumberTrivia()).fold(
      (failure) => emit(Error(_mapFailureToErrorMessage(failure))),
      (data) => emit(Data(data)),
    );
  }

  String _mapFailureToErrorMessage(Failure failure) {
    return switch (failure.runtimeType) {
      ServerFailure => ErrorMessage.serverError,
      CacheFailure => ErrorMessage.cacheError,
      _ => 'Unknown error'
    };
  }
}
