import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'quiz_question_model.dart';

class QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int score;
  final bool isFinished;

  QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.isFinished = false,
  });

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    int? score,
    bool? isFinished,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState(questions: _initialQuestions));

  static final List<QuizQuestion> _initialQuestions = [
    const QuizQuestion(question: "What is Dart?", options: ["Language", "Fruit", "SDK", "Framework"], answerIndex: 0),
    const QuizQuestion(question: "Who developed Flutter?", options: ["Facebook", "Google", "Microsoft", "Apple"], answerIndex: 1),
    const QuizQuestion(question: "Which keyword is used to declare a constant in Dart?", options: ["var", "let", "final", "constant"], answerIndex: 2),
    const QuizQuestion(question: "What is the extension of Dart files?", options: [".dart", ".dr", ".dt", ".flutter"], answerIndex: 0),
    const QuizQuestion(question: "Which collection type is unordered and contains unique items?", options: ["List", "Set", "Map", "Array"], answerIndex: 1),
    const QuizQuestion(question: "What does JIT stand for in Dart?", options: ["Just-In-Time", "Jump-In-Technique", "Joint-Integration-Tool", "Just-Internal-Task"], answerIndex: 0),
    const QuizQuestion(question: "Which operator is used for null-aware access in Dart?", options: ["!", "?.", "??", "??="], answerIndex: 1),
  ];

  void checkAnswer(int selectedIndex) {
    if (state.isFinished) return;

    final isCorrect = selectedIndex == state.questions[state.currentIndex].answerIndex;
    final newScore = isCorrect ? state.score + 1 : state.score;
    
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        score: newScore,
      );
    } else {
      state = state.copyWith(
        score: newScore,
        isFinished: true,
      );
    }
  }

  void reset() {
    state = QuizState(questions: _initialQuestions);
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});
