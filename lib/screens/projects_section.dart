import 'package:flutter/material.dart';
import '../helper/responsive.dart';
import '../helper/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.getResponsiveValue(
      context,
      mobile: 30,
      tablet: 50,
      desktop: 80,
    );

    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          const SectionTitle(title: 'Featured Projects'),
          SizedBox(height: isMobile ? 30 : 60),
          Wrap(
            spacing: isMobile ? 20 : 30,
            runSpacing: isMobile ? 20 : 30,
            alignment: WrapAlignment.center,
            children: [
              _buildProjectCard(
                'EliteVahan',
                'A car rental application offering real-time availability, secure authentication, role-based access, and smooth booking workflows.',
                ['Flutter', 'MongoDB', 'NodeJs'],
                isMobile,
                isTablet,
              ),
              _buildProjectCard(
                'Sandesha Chat Application',
                'A real-time chat application featuring secure authentication, encrypted messaging, and seamless cross-platform communication.',
                ['Flutter', 'WebSockets', 'MongoDB'],
                isMobile,
                isTablet,
              ),
              _buildProjectCard(
                'Fitness Tracker',
                'Track workouts, calories, and progress with AI-powered recommendations.',
                ['Flutter', 'ML Kit', 'HealthKit'],
                isMobile,
                isTablet,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, List<String> tech,
      bool isMobile, bool isTablet) {
    final cardWidth = isMobile
        ? double.infinity
        : isTablet
        ? 300.0
        : 350.0;

    // Fixed height for consistent card sizes
    final cardHeight = isMobile ? 420.0 : 480.0;

    return Container(
      width: isMobile ? null : cardWidth,
      height: cardHeight, // Fixed height
      constraints: isMobile ? const BoxConstraints(maxWidth: 400) : null,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF64FFDA).withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with fixed height
          Container(
            height: isMobile ? 150 : 180,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF64FFDA), Color(0xFF4A90E2)],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.smartphone,
                  size: isMobile ? 60 : 80, color: Colors.white),
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: isMobile ? 8 : 10),
          // Description with Expanded to take remaining space
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: Colors.white.withValues(alpha: 0.7),
                height: 1.6,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
          // Tech tags at the bottom
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tech
                .map(
                  (t) => Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 10 : 12,
                  vertical: isMobile ? 4 : 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF64FFDA).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFF64FFDA).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  t,
                  style: TextStyle(
                    fontSize: isMobile ? 11 : 12,
                    color: const Color(0xFF64FFDA),
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    );
  }
}