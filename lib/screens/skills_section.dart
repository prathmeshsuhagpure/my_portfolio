import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helper/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        children: [
          const SectionTitle(title: 'Skills & Technologies'),
          const SizedBox(height: 60),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildSkillCard('Flutter', FontAwesomeIcons.flutter),
              _buildSkillCard('Java', FontAwesomeIcons.java),
              _buildSkillCard('Dart', FontAwesomeIcons.code),
              _buildSkillCard('Firebase', FontAwesomeIcons.fire),
              _buildSkillCard('REST APIs', FontAwesomeIcons.networkWired),
              _buildSkillCard('Git', FontAwesomeIcons.gitAlt),
              _buildSkillCard('State Mgmt', FontAwesomeIcons.gears),
              _buildSkillCard('MongoDB', FontAwesomeIcons.database),

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String name, IconData icon) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF64FFDA).withOpacity(0.25),
        ),
      ),
      child: Column(
        children: [
          FaIcon(
            icon,
            size: 48,
            color: const Color(0xFF64FFDA),
          ),
          const SizedBox(height: 15),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
