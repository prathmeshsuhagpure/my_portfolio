/*
// Hero Section
import 'package:flutter/material.dart';
import 'package:portfolio_web_app/screens/projects_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'glowing_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Container(
      height: size.height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, I\'m',
              style: TextStyle(
                fontSize: isSmallScreen ? 18 : 24,
                color: const Color(0xFF64FFDA),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Prathmesh Suhagpure',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallScreen ? 40 : 72,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Flutter Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isSmallScreen ? 28 : 48,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 0),
              child: Text(
                'I craft beautiful, responsive mobile and web applications using Flutter. Passionate about clean code and exceptional user experiences.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 18,
                  color: Colors.white.withOpacity(0.7),
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                GlowingButton(
                  text: 'View Projects',
                  onPressed: () {
                    Navigator.push((context),
                        MaterialPageRoute(builder: (context) => const ProjectsSection()));
                  },
                  isPrimary: true,
                ),
                GlowingButton(
                  text: 'Download Resume',
                  onPressed: () async {
                    const url = 'https://drive.google.com/file/d/1iDB8v4JdTELFTBFMdWKKoi7VrF9IvbfV/view?usp=sharing';

                    final uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  isPrimary: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/

// Hero Section
import 'package:flutter/material.dart';
import 'package:portfolio_web_app/screens/projects_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'glowing_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 900;

    return Container(
      height: size.height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 40),
      child: Center(
        child: isSmallScreen
            ? _buildMobileLayout(context, isSmallScreen)
            : _buildDesktopLayout(context),
      ),
    );
  }

  // Mobile layout - stacked vertically
  Widget _buildMobileLayout(BuildContext context, bool isSmallScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildProfileImage(size: 200),
        const SizedBox(height: 40),
        _buildTextContent(context, isSmallScreen),
      ],
    );
  }

  // Desktop layout - side by side
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildTextContent(context, false),
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 2,
          child: _buildProfileImage(size: 350),
        ),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, bool isSmallScreen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
      isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I\'m',
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isSmallScreen ? 18 : 24,
            color: const Color(0xFF64FFDA),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Prathmesh Suhagpure',
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isSmallScreen ? 40 : 72,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Flutter Developer',
          textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isSmallScreen ? 28 : 48,
            fontWeight: FontWeight.w500,
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 0),
          child: Text(
            'I craft beautiful, responsive mobile and web applications using Flutter. Passionate about clean code and exceptional user experiences.',
            textAlign: isSmallScreen ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              color: Colors.white.withOpacity(0.7),
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 50),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment:
          isSmallScreen ? WrapAlignment.center : WrapAlignment.start,
          children: [
            GlowingButton(
              text: 'View Projects',
              onPressed: () {
                Navigator.push(
                    (context),
                    MaterialPageRoute(
                        builder: (context) => const ProjectsSection()));
              },
              isPrimary: true,
            ),
            GlowingButton(
              text: 'Download Resume',
              onPressed: () async {
                const url =
                    'https://drive.google.com/file/d/1iDB8v4JdTELFTBFMdWKKoi7VrF9IvbfV/view?usp=sharing';

                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  );
                } else {
                  throw 'Could not launch $url';
                }
              },
              isPrimary: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileImage({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF64FFDA),
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64FFDA).withOpacity(0.3),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset(
          'assets/images/profile_pic.jpg',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF1a1f3a),
              child: const Icon(
                Icons.person,
                size: 100,
                color: Color(0xFF64FFDA),
              ),
            );
          },
        ),
      ),
    );
  }
}