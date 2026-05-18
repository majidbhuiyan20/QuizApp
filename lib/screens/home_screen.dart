import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/quiz_provider.dart';
import '../widgets/quiz_background.dart';
import '../widgets/quiz_header.dart';
import '../widgets/progress_bar.dart';
import '../widgets/question_container.dart';
import '../widgets/result_dialog.dart';
import '../widgets/custom_toast.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showResult(BuildContext context, int score, int total) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Result",
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, anim1, anim2) => const SizedBox.shrink(),
      transitionBuilder: (context, anim1, anim2, child) {
        return ResultDialog(score: score, total: total);
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);
    final currentQuestion = quizState.questions[quizState.currentIndex];

    ref.listen(quizProvider, (previous, next) {
      // 1. Handle Toast for every selection
      if (next.answerTimestamp != previous?.answerTimestamp && next.answerTimestamp != null) {
        CustomToast.show(context, isCorrect: next.lastAnswerWasCorrect ?? false);
      }

      // 2. Handle Result Dialog when finished
      if (next.isFinished && (previous == null || !previous.isFinished)) {
        _showResult(context, next.score, next.questions.length);
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const QuizBackground(),
          SafeArea(
            child: Column(
              children: [
                QuizHeader(score: quizState.score),
                const SizedBox(height: 10),
                ProgressBar(
                  currentIndex: quizState.currentIndex,
                  totalQuestions: quizState.questions.length,
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: QuestionContainer(
                    currentIndex: quizState.currentIndex,
                    question: currentQuestion.question,
                    options: currentQuestion.options,
                    onOptionSelected: (index) {
                      ref.read(quizProvider.notifier).checkAnswer(index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
