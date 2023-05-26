import 'package:class3/data_model.dart';

class QuizBrain {
  //Atributes
  int _questionCount = 0;

  //QuestionList
  List<DataModel> _questionList = [
    DataModel('Some cats are actually allergic to humans', true),
    DataModel('You can lead a cow down stairs but not up stairs.', false),
    DataModel('Approximately one quarter of human bones are in the feet.', true),
    DataModel('A slug\'s blood is green.', true),
    DataModel('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    DataModel('It is illegal to pee in the Ocean in Portugal.', true),
    DataModel('No piece of square dry paper can be folded in half more than 7 times.', false),
    DataModel(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    DataModel(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    DataModel('The total surface area of two human lungs is approximately 70 square metres.', true),
    DataModel('Google was originally called \"Backrub\".', true),
    DataModel(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    DataModel(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true)
  ];

  //Getters Methods for reading attributes
  String get getQuestionText {
    return _questionList[_questionCount].question;
  }

  bool get getQuestionAnswer {
    return _questionList[_questionCount].answer;
  }

  // Method for increment question

  void nextQuestion() {
    if (_questionCount < _questionList.length - 1) {
      _questionCount++;
    }
  }

  bool lastQuestion() {
    if (_questionCount == _questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void restartApp(){
    _questionCount = 0;
  }
}
