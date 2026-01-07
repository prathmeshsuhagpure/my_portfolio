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
