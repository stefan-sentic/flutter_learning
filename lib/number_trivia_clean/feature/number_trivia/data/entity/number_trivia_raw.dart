import 'package:learning/number_trivia_clean/feature/number_trivia/domain/model/number_trivia.dart';

class NumberTriviaRaw extends NumberTrivia {
  NumberTriviaRaw({required number, required text}) : super(number: number, text: text);

  factory NumberTriviaRaw.fromJson(Map<String, dynamic> json) {
    return NumberTriviaRaw(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
        'text': text,
        'number': number,
      };
}
