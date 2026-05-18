import 'dart:io';

void main(){
  print("============Quiz App==============");
  List<QuizQuestion> questionBank = [
    QuizQuestion(question: "What is Dart?", options: ["Language", "Fruit", "SDK", "Framework"], answerIndex: 0),
    QuizQuestion(question: "Who developed Flutter?", options: ["Facebook", "Google", "Microsoft", "Apple"], answerIndex: 1),
    QuizQuestion(question: "Which keyword is used to declare a constant in Dart?", options: ["var", "let", "final", "constant"], answerIndex: 2),
    QuizQuestion(question: "What is the extension of Dart files?", options: [".dart", ".dr", ".dt", ".flutter"], answerIndex: 0),
    QuizQuestion(question: "Which collection type is unordered and contains unique items?", options: ["List", "Set", "Map", "Array"], answerIndex: 1),
    QuizQuestion(question: "What does JIT stand for in Dart?", options: ["Just-In-Time", "Jump-In-Technique", "Joint-Integration-Tool", "Just-Internal-Task"], answerIndex: 0),
    QuizQuestion(question: "Which operator is used for null-aware access in Dart?", options: ["!", "?.", "??", "??="], answerIndex: 1),
  ];

for(QuizQuestion question in questionBank){
  showQuestion(question);
  print("Which one is correctZ: ");
  int correctAnswer = int.parse(stdin.readLineSync()!);
  validateAnswer(question, correctAnswer);
}
}
void showQuestion(QuizQuestion question){
  print(question.question);
  showOptions(question.options);

}

void showOptions(List<String> options){
  for(int i =0; i< options.length; i++){
    print("${i+1}. ${options[i]}");
  }
}
validateAnswer(QuizQuestion question, int answer){
  if(answer == question.answerIndex){
    print("Correct Answer");
  }else{
    print("Wrong Answer");
  }
}

class QuizQuestion{
  String question;
  List<String> options;
  int answerIndex;

  QuizQuestion({required this.question, required this.options, required this.answerIndex});
}