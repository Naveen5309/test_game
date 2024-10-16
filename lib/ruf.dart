import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for wave movement
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // Loop the animation infinitely
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wave Animation'),
      ),
      body: Stack(
        children: [
          // Background waves animation
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return CustomPaint(
                painter: WavePainter(_animationController.value),
                child: Container(),
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Waves Animation',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'This is a fluid wave animation implemented with CustomPaint.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for drawing wave
class WavePainter extends CustomPainter {
  final double waveAnimationValue;

  WavePainter(this.waveAnimationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Wave properties
    const waveHeight = 100.0;
    final waveLength = size.width;
    final waveSpeed = waveLength * waveAnimationValue;

    // Starting point of wave
    path.moveTo(0, size.height / 2);

    for (double i = 0; i <= size.width; i += 1) {
      // Sine wave calculation
      final y = waveHeight * sin((i + waveSpeed) * 2 * pi / waveLength) +
          size.height / 2;
      path.lineTo(i, y);
    }

    // Fill the rest of the bottom part
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
