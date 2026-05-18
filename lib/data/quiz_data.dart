import '../models/quiz_question.dart';

const List<QuizQuestion> quizQuestions = [
  QuizQuestion(question: "What is Dart?", options: ["Language", "Fruit", "SDK", "Framework"], answerIndex: 0),
  QuizQuestion(question: "Who developed Flutter?", options: ["Facebook", "Google", "Microsoft", "Apple"], answerIndex: 1),
  QuizQuestion(question: "Which keyword is used to declare a constant in Dart?", options: ["var", "let", "final", "constant"], answerIndex: 2),
  QuizQuestion(question: "What is the extension of Dart files?", options: [".dart", ".dr", ".dt", ".flutter"], answerIndex: 0),
  QuizQuestion(question: "Which collection type is unordered and contains unique items?", options: ["List", "Set", "Map", "Array"], answerIndex: 1),
  QuizQuestion(question: "What does JIT stand for in Dart?", options: ["Just-In-Time", "Jump-In-Technique", "Joint-Integration-Tool", "Just-Internal-Task"], answerIndex: 0),
  QuizQuestion(question: "Which operator is used for null-aware access in Dart?", options: ["!", "?.", "??", "??="], answerIndex: 1),
  QuizQuestion(question: "What is the main function of a StatefulWidget?", options: ["To hold data", "To manage mutable state", "To define UI structure", "To handle HTTP requests"], answerIndex: 1),
  QuizQuestion(question: "Which widget is used for repeating content in Flutter?", options: ["Column", "ListView", "Stack", "Container"], answerIndex: 1),
  QuizQuestion(question: "What command is used to run a Flutter app?", options: ["flutter start", "flutter build", "flutter run", "flutter launch"], answerIndex: 2),
  QuizQuestion(question: "Which widget is the root of most Flutter apps?", options: ["Container", "MaterialApp", "Scaffold", "WidgetApp"], answerIndex: 1),
  QuizQuestion(question: "What is the command to create a new Flutter project?", options: ["flutter new", "flutter start", "flutter create", "flutter init"], answerIndex: 2),
  QuizQuestion(question: "Which language is the Flutter engine primarily written in?", options: ["Dart", "Java", "C++", "Kotlin"], answerIndex: 2),
  QuizQuestion(question: "What is the use of 'pubspec.yaml' file?", options: ["Project configuration", "Assets management", "Managing dependencies", "All of the above"], answerIndex: 3),
  QuizQuestion(question: "What are the two types of widgets in Flutter?", options: ["Stateless and Stateful", "Static and Dynamic", "Local and Global", "Simple and Complex"], answerIndex: 0),
  QuizQuestion(question: "Which folder contains the native Android code?", options: ["ios", "lib", "android", "build"], answerIndex: 2),
  QuizQuestion(question: "What is the purpose of the 'main()' function in Dart?", options: ["Defining classes", "Entry point of app", "Exporting files", "Testing code"], answerIndex: 1),
  QuizQuestion(question: "Which widget is used to align widgets horizontally?", options: ["Column", "Stack", "Row", "Padding"], answerIndex: 2),
  QuizQuestion(question: "What is 'hot reload' in Flutter?", options: ["Rebuilding the whole app", "Syncing with cloud", "Injecting code changes without losing state", "Restarting the device"], answerIndex: 2),
  QuizQuestion(question: "Which widget provides a basic Material Design layout structure?", options: ["Container", "Column", "Scaffold", "SizedBox"], answerIndex: 2),
];
