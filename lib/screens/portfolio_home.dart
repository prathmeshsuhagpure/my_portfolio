/*
import 'package:flutter/material.dart';
import 'package:portfolio_web_app/helper/custom_drawer.dart';
import 'package:portfolio_web_app/screens/projects_section.dart';
import 'package:portfolio_web_app/screens/skills_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helper/animation.dart';
import '../helper/hero_section.dart';
import '../helper/responsive.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'custom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: (!isDesktop)
          ? AppBar(
              backgroundColor: const Color(0xFF0A0E27),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFF64FFDA)),
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
            )
          : null,
      drawer: (!isDesktop)
          ? AppDrawer(
              onHomePressed: () => _scrollToSection(homeKey),
              onAboutPressed: () => _scrollToSection(aboutKey),
              onSkillsPressed: () => _scrollToSection(skillsKey),
              onProjectsPressed: () => _scrollToSection(projectsKey),
              onContactPressed: () => _scrollToSection(contactKey),
            )
          : null,
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                const AnimatedBackground(),
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    if (isDesktop)
                      SliverToBoxAdapter(
                        child: CustomNavBar(
                          scaffoldKey: _scaffoldKey,
                          onHomePressed: () => _scrollToSection(homeKey),
                          onAboutPressed: () => _scrollToSection(aboutKey),
                          onSkillsPressed: () => _scrollToSection(skillsKey),
                          onProjectsPressed: () =>
                              _scrollToSection(projectsKey),
                          onContactPressed: () => _scrollToSection(contactKey),
                        ),
                      ),
                    SliverToBoxAdapter(child: HeroSection(key: homeKey)),
                    SliverToBoxAdapter(child: AboutSection(key: aboutKey)),
                    SliverToBoxAdapter(child: SkillsSection(key: skillsKey)),
                    SliverToBoxAdapter(
                        child: ProjectsSection(key: projectsKey)),
                    SliverToBoxAdapter(child: ContactSection(key: contactKey)),
                  ],
                ),
                if (isDesktop) const VerticalSocialBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Vertical Social Bar
class VerticalSocialBar extends StatelessWidget {
  const VerticalSocialBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(FontAwesomeIcons.github, 'GitHub', () {
              launchUrl(
                Uri.parse('https://github.com/prathmeshsuhagpure'),
                mode: LaunchMode.externalApplication,
              );
            }),
            const SizedBox(height: 20),
            _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'LinkedIn', () {
              launchUrl(
                Uri.parse(
                    'https://www.linkedin.com/in/prathmeshsuhagpure'),
                mode: LaunchMode.externalApplication,
              );
            }),
            const SizedBox(height: 20),
            _buildSocialIcon(FontAwesomeIcons.envelope, 'Email', () async {
              final uri = Uri(
                scheme: 'mailto',
                path: 'prathmesh@example.com',
                queryParameters: {
                  'subject': 'Contact',
                  'body': 'Hello Prathmesh',
                },
              );
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }),
            const SizedBox(height: 20),
            Container(
              width: 2,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF64FFDA),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(
      IconData icon, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedSocialIcon(
          icon: icon,
          onTap: onTap,
        ),
      ),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:portfolio_web_app/helper/custom_drawer.dart';
import 'package:portfolio_web_app/screens/projects_section.dart';
import 'package:portfolio_web_app/screens/skills_section.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helper/animation.dart';
import '../helper/hero_section.dart';
import '../helper/responsive.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'custom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: (!isDesktop)
          ? AppBar(
        backgroundColor: const Color(0xFF0A0E27),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xFF64FFDA)),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      )
          : null,
      drawer: (!isDesktop)
          ? AppDrawer(
        onHomePressed: () => _scrollToSection(homeKey),
        onAboutPressed: () => _scrollToSection(aboutKey),
        onSkillsPressed: () => _scrollToSection(skillsKey),
        onProjectsPressed: () => _scrollToSection(projectsKey),
        onContactPressed: () => _scrollToSection(contactKey),
      )
          : null,
      body: Row(
        children: [
          // Fixed vertical social bar - outside the scrollable content
          if (isDesktop) const VerticalSocialBar(),
          Expanded(
            child: Stack(
              children: [
                const AnimatedBackground(),
                CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    if (isDesktop)
                      SliverToBoxAdapter(
                        child: CustomNavBar(
                          scaffoldKey: _scaffoldKey,
                          onHomePressed: () => _scrollToSection(homeKey),
                          onAboutPressed: () => _scrollToSection(aboutKey),
                          onSkillsPressed: () => _scrollToSection(skillsKey),
                          onProjectsPressed: () =>
                              _scrollToSection(projectsKey),
                          onContactPressed: () => _scrollToSection(contactKey),
                        ),
                      ),
                    SliverToBoxAdapter(child: HeroSection(key: homeKey)),
                    SliverToBoxAdapter(child: AboutSection(key: aboutKey)),
                    SliverToBoxAdapter(child: SkillsSection(key: skillsKey)),
                    SliverToBoxAdapter(
                        child: ProjectsSection(key: projectsKey)),
                    SliverToBoxAdapter(child: ContactSection(key: contactKey)),
                  ],
                ),
                // Removed VerticalSocialBar from here
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Vertical Social Bar
class VerticalSocialBar extends StatelessWidget {
  const VerticalSocialBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Fixed width for the social bar column
      padding: const EdgeInsets.only(left: 40, bottom: 40),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSocialIcon(FontAwesomeIcons.github, 'GitHub', () {
              launchUrl(
                Uri.parse('https://github.com/prathmeshsuhagpure'),
                mode: LaunchMode.externalApplication,
              );
            }),
            const SizedBox(height: 20),
            _buildSocialIcon(FontAwesomeIcons.linkedinIn, 'LinkedIn', () {
              launchUrl(
                Uri.parse(
                    'https://www.linkedin.com/in/prathmeshsuhagpure'),
                mode: LaunchMode.externalApplication,
              );
            }),
            const SizedBox(height: 20),
            _buildSocialIcon(FontAwesomeIcons.envelope, 'Email', () async {
              final uri = Uri(
                scheme: 'mailto',
                path: 'prathmesh@example.com',
                queryParameters: {
                  'subject': 'Contact',
                  'body': 'Hello Prathmesh',
                },
              );
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }),
            const SizedBox(height: 20),
            _buildSocialIcon(FontAwesomeIcons.whatsapp, 'WhatsApp', () {
              launchUrl(
                Uri.parse(
                    'https://wa.me/917038360065?text=Hello%20Prathmesh'),
                mode: LaunchMode.externalApplication,
              );


            }),
            const SizedBox(height: 20),
            Container(
              width: 2,
              height: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF64FFDA),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(
      IconData icon, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedSocialIcon(
          icon: icon,
          onTap: onTap,
        ),
      ),
    );
  }
}