// About Section
import 'package:flutter/material.dart';
import '../helper/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 40 : 80),
      child: Column(
        children: [
          const SectionTitle(title: 'About Me'),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 900) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Passionate Flutter Developer with expertise in creating cross-platform applications that run seamlessly on iOS, Android, Web, and Desktop.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withValues(alpha: 0.8),
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'I specialize in building scalable, maintainable apps with clean architecture, state management (BLoC, Riverpod), and modern UI/UX principles. My focus is on delivering exceptional user experiences through performant, pixel-perfect implementations.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withValues(alpha: 0.8),
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _buildStatCard('1+', 'Years Experience'),
                              _buildStatCard('5+', 'Projects Completed'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                    _buildDeveloperIllustration(300, 300),
                  ],
                );
              } else {
                return Column(
                  children: [
                    _buildDeveloperIllustration(250, 250),
                    const SizedBox(height: 40),
                    Text(
                      'Passionate Flutter Developer with expertise in creating cross-platform applications.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withValues(alpha: 0.8),
                        height: 1.8,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDeveloperIllustration(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF64FFDA).withValues(alpha: 0.1),
            const Color(0xFF4A90E2).withValues(alpha: 0.1),
          ],
        ),
        border: Border.all(
          color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          // Background code pattern
          Positioned.fill(
            child: CustomPaint(
              painter: CodePatternPainter(),
            ),
          ),
          // Flutter logo and developer elements
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Flutter logo representation
                Container(
                  width: width * 0.4,
                  height: width * 0.4,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF64FFDA), Color(0xFF4A90E2)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Flutter-inspired triangular shapes
                      CustomPaint(
                        size: Size(width * 0.4, width * 0.4),
                        painter: FlutterLogoPainter(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Floating code brackets
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFloatingIcon(Icons.laptop_mac, -10),
                    const SizedBox(width: 20),
                    _buildFloatingIcon(Icons.phone_android, 0),
                    const SizedBox(width: 20),
                    _buildFloatingIcon(Icons.web, 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingIcon(IconData icon, double offset) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, offset + (value * 10 - 5)),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF64FFDA).withValues(alpha: 0.5),
              ),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF64FFDA),
              size: 24,
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard(String number, String label) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF64FFDA).withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF64FFDA),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for Flutter logo inspired design
class FlutterLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    // Draw triangular shapes inspired by Flutter logo
    final path1 = Path()
      ..moveTo(center.dx, center.dy - radius)
      ..lineTo(center.dx + radius * 0.6, center.dy)
      ..lineTo(center.dx, center.dy + radius * 0.3)
      ..close();

    final path2 = Path()
      ..moveTo(center.dx, center.dy)
      ..lineTo(center.dx + radius * 0.6, center.dy + radius)
      ..lineTo(center.dx, center.dy + radius * 0.3)
      ..close();

    canvas.drawPath(path1, paint);

    paint.color = Colors.white.withValues(alpha: 0.7);
    canvas.drawPath(path2, paint);

    // Draw angle bracket symbols
    final bracketPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.white.withValues(alpha: 0.3);

    final leftBracket = Path()
      ..moveTo(center.dx - radius * 0.7, center.dy - radius * 0.3)
      ..lineTo(center.dx - radius * 0.9, center.dy)
      ..lineTo(center.dx - radius * 0.7, center.dy + radius * 0.3);

    canvas.drawPath(leftBracket, bracketPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for code pattern background
class CodePatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color(0xFF64FFDA).withValues(alpha: 0.1);

    // Draw grid lines
    for (double i = 0; i < size.width; i += 30) {
      canvas.drawLine(
        Offset(i, 0),
        Offset(i, size.height),
        paint,
      );
    }

    for (double i = 0; i < size.height; i += 30) {
      canvas.drawLine(
        Offset(0, i),
        Offset(size.width, i),
        paint,
      );
    }

    // Draw some code-like dots
    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF64FFDA).withValues(alpha: 0.2);

    for (double i = 15; i < size.width; i += 60) {
      for (double j = 15; j < size.height; j += 60) {
        canvas.drawCircle(Offset(i, j), 2, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}