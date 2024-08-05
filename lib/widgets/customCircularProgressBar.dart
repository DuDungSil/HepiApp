import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/constants.dart';

class CustomCircularProgressBar extends StatefulWidget {
  final int value;
  final double size;
  final Widget? child;

  const CustomCircularProgressBar({super.key, required this.value, required this.size, this.child});

  @override
  State<CustomCircularProgressBar> createState() => _CustomCircularProgressBarState();
}

class _CustomCircularProgressBarState extends State<CustomCircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      // child: CircularProgressIndicator(
      //   value: 0.8,
      //   strokeCap: StrokeCap.square,
      //   strokeWidth: 20,
      //   color: Color(0xFFFF8A00).withAlpha((60 * 255 / 100).round()),
      //   backgroundColor: Color(0xFFFF8A00).withAlpha((60 * 255 / 100).round()),
      // ),
      // child : CircularPercentIndicator(
      //   radius: 80.0,
      //   lineWidth: 13.0,
      //   animation: true,
      //   percent: 0.7,
      //   center: Text(
      //     "70%",
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      //   ),
      //   circularStrokeCap: CircularStrokeCap.round,
      //   progressColor: Colors.purple,
      //   backgroundColor: Colors.grey,
      //   // Add a shadow to give a 3D effect
      // ),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(widget.size, widget.size),
            painter: ProgressPainter(
                value: widget.value,
                strokeWidth: 14
            ),
          ),
          Positioned(
            child: Center(
              child: widget.child ?? Container(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final int value;
  final double strokeWidth;

  const ProgressPainter({required this.value, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    double progress = value / 100; // Example progress

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2;

    // Background paint for unfilled part of the progress indicator
    Paint backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Color(0xFFFF8A00).withAlpha((60 * 255 / 100).round());

    // Main progress paint
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Color(0xFFFF8A00);

    // Shadow paint
    Paint shadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.black45
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);

    // Draw shadow arc first with slight offset
    canvas.save();
    canvas.translate(3, 3); // Move the shadow slightly to create a 3D effect
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 / 2,
      3.14 * 2 * progress,
      false,
      shadowPaint,
    );
    canvas.restore();

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw main progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14 / 2,
      3.14 * 2 * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
