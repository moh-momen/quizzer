class Question {
  String question;
  bool answer;

  Question(String q, bool a) {
    question = q;
    answer = a;
  }
}

class QuestionBank {
  List<Question> _allQuestions = [
    Question("Yemen in located in Africa?", false),
    Question("Ankara is the capital of Turkey?", true),
    Question("USE in Europe?", false),
    Question("Love is hell?", false),




  ];

  String getQuestions(int question_num) {
    return _allQuestions[question_num].question;
  }

  bool getCorrectAnswer(int question_num) {
    return _allQuestions[question_num].answer;
  }

  int getNumberOfQuestions(){
    return _allQuestions.length;
  }
}
