import 'package:flutter/material.dart';

class QuizBackground extends StatelessWidget {
  const QuizBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF0D47A1),
                const Color(0xFF1976D2),
                Colors.blue.shade400,
              ],
            ),
          ),
        ),
        Positioned(
          top: -100,
          right: -100,
          child: _Orb(color: Colors.white.withOpacity(0.1), size: 300),
        ),
        Positioned(
          bottom: -50,
          left: -50,
          child: _Orb(color: Colors.blue.shade900.withOpacity(0.2), size: 200),
        ),
      ],
    );
  }
}

class _Orb extends StatelessWidget {
  final Color color;
  final double size;

  const _Orb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
