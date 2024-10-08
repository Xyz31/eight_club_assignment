import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomProgressBar extends StatefulWidget {
  final int currentPage;
  final VoidCallback onBackPressed;
  final VoidCallback onNextPressed;
  const CustomProgressBar({
    super.key,
    required this.currentPage,
    required this.onBackPressed,
    required this.onNextPressed,
  });

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    double targetProgress = widget.currentPage == 0 ? 0.3 : 0.66;
    final width = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: widget.onBackPressed,
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetProgress),
          duration: const Duration(milliseconds: 1500),
          builder: (context, value, child) {
            return CustomPaint(
              size: Size(width * 0.6, 20),
              painter: SnakeProgressPainter(progress: value),
            );
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.cancel_presentation_outlined,
            color: Colors.white,
          ),
          onPressed: widget.onNextPressed,
        ),
      ],
    );
  }
}

class SnakeProgressPainter extends CustomPainter {
  final double progress;

  SnakeProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = const Color(0xFF9196FF)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final progressPath = Path();

    for (double i = 0; i <= size.width; i += 4) {
      double y = math.sin(i * 0.3) * 2; // Increased frequency and amplitude
      if (i == 0) {
        path.moveTo(i, size.height / 2 + y);
        progressPath.moveTo(i, size.height / 2 + y);
      } else {
        path.lineTo(i, size.height / 2 + y);
        if (i / size.width <= progress) {
          progressPath.lineTo(i, size.height / 2 + y);
        }
      }
    }

    canvas.drawPath(path, paint);
    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
