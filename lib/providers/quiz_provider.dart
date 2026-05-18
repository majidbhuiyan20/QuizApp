import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/quiz_question.dart';
import '../data/quiz_data.dart';

class QuizState {
  final List<QuizQuestion> questions;
  final int currentIndex;
  final int score;
  final bool isFinished;
  final bool? lastAnswerWasCorrect;
  final DateTime? answerTimestamp; // Added to ensure listener triggers every time

  QuizState({
    required this.questions,
    this.currentIndex = 0,
    this.score = 0,
    this.isFinished = false,
    this.lastAnswerWasCorrect,
    this.answerTimestamp,
  });

  QuizState copyWith({
    List<QuizQuestion>? questions,
    int? currentIndex,
    int? score,
    bool? isFinished,
    bool? lastAnswerWasCorrect,
    DateTime? answerTimestamp,
  }) {
    return QuizState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      score: score ?? this.score,
      isFinished: isFinished ?? this.isFinished,
      lastAnswerWasCorrect: lastAnswerWasCorrect ?? this.lastAnswerWasCorrect,
      answerTimestamp: answerTimestamp ?? this.answerTimestamp,
    );
  }
}

class QuizNotifier extends StateNotifier<QuizState> {
  QuizNotifier() : super(QuizState(questions: quizQuestions));

  void checkAnswer(int selectedIndex) {
    if (state.isFinished) return;

    final isCorrect = selectedIndex == state.questions[state.currentIndex].answerIndex;
    final newScore = isCorrect ? state.score + 1 : state.score;
    
    if (state.currentIndex < state.questions.length - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        score: newScore,
        lastAnswerWasCorrect: isCorrect,
        answerTimestamp: DateTime.now(),
      );
    } else {
      state = state.copyWith(
        score: newScore,
        isFinished: true,
        lastAnswerWasCorrect: isCorrect,
        answerTimestamp: DateTime.now(),
      );
    }
  }

  void reset() {
    state = QuizState(questions: quizQuestions);
  }
}

final quizProvider = StateNotifierProvider<QuizNotifier, QuizState>((ref) {
  return QuizNotifier();
});
