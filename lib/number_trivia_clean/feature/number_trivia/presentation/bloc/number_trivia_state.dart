part of 'number_trivia_bloc.dart';

sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

class Empty extends NumberTriviaState {
  const Empty();

  @override
  List<Object> get props => [];
}

class Loading extends NumberTriviaState {
  const Loading();

  @override
  List<Object> get props => [];
}

class Data extends NumberTriviaState {
  final NumberTrivia data;

  const Data(this.data);

  @override
  List<Object> get props => [data];
}

class Error extends NumberTriviaState {
  final String message;

  const Error(this.message);

  @override
  List<Object> get props => [message];
}
