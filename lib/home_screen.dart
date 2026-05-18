import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'quiz_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showResultDialog(BuildContext context, WidgetRef ref, int score, int total) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Finished!"),
        content: Text("Your score is $score/$total"),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(quizProvider.notifier).reset();
              Navigator.pop(context);
            },
            child: const Text("Restart"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizState = ref.watch(quizProvider);
    final currentQuestion = quizState.questions[quizState.currentIndex];

    // Listen for completion to show dialog
    ref.listen(quizProvider.select((s) => s.isFinished), (previous, next) {
      if (next) {
        _showResultDialog(
          context,
          ref,
          quizState.score,
          quizState.questions.length,
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Quiz"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Score: ${quizState.score}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (quizState.currentIndex + 1) / quizState.questions.length,
            ),
            const SizedBox(height: 32),
            Text(
              "Question ${quizState.currentIndex + 1}/${quizState.questions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              currentQuestion.question,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 32),
            ...List.generate(
              currentQuestion.options.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(quizProvider.notifier).checkAnswer(index);
                  },
                  child: Text(currentQuestion.options[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
