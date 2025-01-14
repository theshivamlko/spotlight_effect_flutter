import 'package:flutter/material.dart';

class SpotlightEffect extends StatefulWidget {
  final Widget child;
  final Color spotlightColor;
  final double intensity;

  const SpotlightEffect({
    Key? key,
    required this.child,
    this.spotlightColor = Colors.black,
    this.intensity = 0.7,
  }) : super(key: key);

  @override
  State<SpotlightEffect> createState() => _SpotlightEffectState();
}

class _SpotlightEffectState extends State<SpotlightEffect> {
  Offset _spotlightPosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _spotlightPosition = details.localPosition;
        });
      },
      child: Stack(
        children: [

          ClipRect(
            child: widget.child,
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: _BackgroundPainter(
                radius: 100,
                position: _spotlightPosition,
                color: Colors.red, // Bac
                // kground color
              ),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: _SpotlightPainter(
                color: Colors.white,
                position: _spotlightPosition,
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final Color color;
  final Offset position;
  final double radius;

  _BackgroundPainter({
    required this.color,
    required this.position,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Create a path for the circle cutout
    final path = Path();
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint2 = Paint();
    paint2.color=Colors.transparent;
    paint2.blendMode = BlendMode.clear;
    path.addOval(Rect.fromCircle(center: position, radius: size.width / 2));

    path.fillType = PathFillType.evenOdd; // This is key for the cutout

    canvas.drawPath(path, paint2,);
  }

  @override
  bool shouldRepaint(_BackgroundPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.position != position ||
        oldDelegate.radius != radius;
  }
}
class _SpotlightPainter extends CustomPainter {
  final Color color;
  final Offset position;

  _SpotlightPainter({
    required this.color,
    required this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..blendMode = BlendMode.dstOut; // Clear the area within the circle

    final radius = size.width / 2; // Adjust radius as needed
    final gradient = RadialGradient(
      colors: [
        Colors.transparent, // Transparent at the center
        color, // Color at the edges
      ],
      stops: [0.0, 1.0],
    ).createShader(
      Rect.fromCircle(center: position, radius: radius),
    );

    paint.shader = gradient;
    canvas.drawCircle(position, radius, paint);
  }

  @override
  bool shouldRepaint(_SpotlightPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.position != position;
  }
}
