import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio_web_app/screens/portfolio_home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _progressController;
  late AnimationController _particleController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _logoRotation;
  late Animation<double> _glowAnimation;

  double _progress = 0.0;
  String _loadingText = 'Initializing...';

  @override
  void initState() {
    super.initState();

    // Main animation controller
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Progress controller
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    // Particle/glow effect controller
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    _logoRotation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.7, curve: Curves.elasticOut),
      ),
    );

    _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _particleController,
        curve: Curves.easeInOut,
      ),
    );

    _startAnimations();
  }

  void _startAnimations() {
    _mainController.forward();

    // Simulate loading progress
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_progress >= 1.0) {
        timer.cancel();
        _navigateToHome();
        return;
      }

      setState(() {
        _progress = (_progress + 0.033).clamp(0.0, 1.0);

        if (_progress < 0.3) {
          _loadingText = 'Loading assets...';
        } else if (_progress < 0.6) {
          _loadingText = 'Building widgets...';
        } else if (_progress < 0.9) {
          _loadingText = 'Compiling Dart...';
        } else {
          _loadingText = 'Almost ready...';
        }
      });
    });
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PortfolioHome(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  void dispose() {
    _mainController.dispose();
    _progressController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1a1f3a),
              Color(0xFF2d1b4e),
              Color(0xFF0A0E27),
            ],
            stops: [0.0, 0.4, 0.7, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Animated background particles
            ...List.generate(20, (index) => _buildParticle(index)),

            // Main content
            Center(
              child: AnimatedBuilder(
                animation: _mainController,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Flutter logo with glow effect
                      Transform.translate(
                        offset: Offset(0, _slideAnimation.value),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _buildFlutterLogo(),
                        ),
                      ),

                      const SizedBox(height: 50),

                      // Developer title
                      Transform.translate(
                        offset: Offset(0, _slideAnimation.value),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: Column(
                            children: [
                              const Text(
                                'FLUTTER DEVELOPER',
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF64FFDA),
                                ),
                              ),
                              const SizedBox(height: 15),
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Color(0xFF64FFDA),
                                    Color(0xFF00D4FF),
                                  ],
                                ).createShader(bounds),
                                child: const Text(
                                  'PORTFOLIO',
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 2,
                                width: 100,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Color(0xFF64FFDA),
                                      Colors.transparent,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF64FFDA)
                                          .withValues(alpha: 0.5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 80),

                      // Progress indicator section
                      Opacity(
                        opacity: _fadeAnimation.value,
                        child: _buildProgressSection(),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Version/branding in corner
            Positioned(
              bottom: 30,
              right: 30,
              child: Opacity(
                opacity: _fadeAnimation.value * 0.5,
                child: const Text(
                  'v1.0.0 • Built with Flutter',
                  style: TextStyle(
                    color: Color(0xFF64FFDA),
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                const Color(0xFF64FFDA)
                    .withValues(alpha: 0.2 * _glowAnimation.value),
                Colors.transparent,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF64FFDA)
                    .withValues(alpha: 0.3 * _glowAnimation.value),
                blurRadius: 40,
                spreadRadius: 10,
              ),
              BoxShadow(
                color: const Color(0xFF00D4FF)
                    .withValues(alpha: 0.2 * _glowAnimation.value),
                blurRadius: 60,
                spreadRadius: 20,
              ),
            ],
          ),
          child: Transform.rotate(
            angle: _logoRotation.value * 0.2,
            child: const FlutterLogo(
              size: 120,
              style: FlutterLogoStyle.stacked,
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressSection() {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          // Loading text
          Text(
            _loadingText,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),

          // Progress bar
          Stack(
            children: [
              // Background
              Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Progress fill
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: 4,
                width: 300 * _progress,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF64FFDA),
                      Color(0xFF00D4FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF64FFDA).withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Percentage
          Text(
            '${(_progress * 100).toInt()}%',
            style: const TextStyle(
              color: Color(0xFF64FFDA),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticle(int index) {
    final random = index * 0.1;
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return Positioned(
          left: (index % 5) * MediaQuery.of(context).size.width / 5 +
              (20 * _particleController.value),
          top: (index % 4) * MediaQuery.of(context).size.height / 4 +
              (30 * _particleController.value),
          child: Opacity(
            opacity: 0.3 * _glowAnimation.value,
            child: Container(
              width: 2 + (random * 2),
              height: 2 + (random * 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF64FFDA),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF64FFDA).withValues(alpha: 0.5),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
