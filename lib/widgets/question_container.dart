import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'option_button.dart';

class QuestionContainer extends StatelessWidget {
  final int currentIndex;
  final String question;
  final List<String> options;
  final Function(int) onOptionSelected;

  const QuestionContainer({
    super.key,
    required this.currentIndex,
    required this.question,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 0),
      decoration: const BoxDecoration(
        color: Color(0xFFF8FAFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          );
        },
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
        child: SizedBox.expand(
          key: ValueKey(currentIndex),
          child: Column(
            children: [
              Text(
                question,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1A237E),
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return OptionButton(
                      label: String.fromCharCode(65 + index),
                      option: options[index],
                      onTap: () => onOptionSelected(index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
