import 'question.dart';

class QuestionLogic {
  var _questionIndex = -1;

  final List<Question> _questions = [
    Question(
        text: 'You can lead a cow down stairs but not up stairs',
        answer: false),
    Question(
        text: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(text: 'A slug\'s blood is green', answer: true),
  ];

  String getNextQuestionText() {
    if (_questionIndex < _questions.length - 1) {
      _questionIndex++;
    }
    return _questions[_questionIndex].text;
  }

  bool checkAnswer(bool answer) => answer == _questions[_questionIndex].answer;

  bool isQuizFinished() => _questionIndex == _questions.length - 1;

  void reset() {
    _questionIndex = -1;
  }
}
