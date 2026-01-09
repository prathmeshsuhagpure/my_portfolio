/*
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const AppDrawer({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A192F),
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundImage:
                    AssetImage('assets/images/profile_pic.jpg'),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Prathmesh Suhagpure',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64FFDA),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(color: Colors.white12),

            _DrawerItem(label: 'Home', onTap: onHomePressed),
            _DrawerItem(label: 'About', onTap: onAboutPressed),
            _DrawerItem(label: 'Skills', onTap: onSkillsPressed),
            _DrawerItem(label: 'Projects', onTap: onProjectsPressed),
            _DrawerItem(label: 'Contact', onTap: onContactPressed),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // close drawer
        onTap();
      },
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const AppDrawer({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A0E27),
      child: Column(
        children: [
          // Header with Profile
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF64FFDA),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF64FFDA),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF64FFDA).withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 42,
                    backgroundImage:
                    AssetImage('assets/images/profile_pic.jpg'),
                    backgroundColor: Color(0xFF1a1f3a),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Prathmesh Suhagpure',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF64FFDA),
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                _buildDrawerItem(
                  context,
                  icon: Icons.home_outlined,
                  title: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    onHomePressed();
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.person_outline,
                  title: 'About',
                  onTap: () {
                    Navigator.pop(context);
                    onAboutPressed();
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.code_outlined,
                  title: 'Skills',
                  onTap: () {
                    Navigator.pop(context);
                    onSkillsPressed();
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.work_outline,
                  title: 'Projects',
                  onTap: () {
                    Navigator.pop(context);
                    onProjectsPressed();
                  },
                ),
                _buildDrawerItem(
                  context,
                  icon: Icons.email_outlined,
                  title: 'Contact',
                  onTap: () {
                    Navigator.pop(context);
                    onContactPressed();
                  },
                ),
              ],
            ),
          ),

          // Social Icons Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFF64FFDA),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Connect With Me',
                  style: TextStyle(
                    color: Color(0xFF64FFDA),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.github,
                      onTap: () {
                        launchUrl(
                          Uri.parse('https://github.com/prathmeshsuhagpure'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.linkedinIn,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                              'https://www.linkedin.com/in/prathmeshsuhagpure'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.envelope,
                      onTap: () async {
                        final uri = Uri(
                          scheme: 'mailto',
                          path: 'prathmesh@example.com',
                          queryParameters: {
                            'subject': 'Contact',
                            'body': 'Hello Prathmesh',
                          },
                        );
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      },
                    ),
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.whatsapp,
                      onTap: () {
                        launchUrl(
                          Uri.parse(
                              'https://wa.me/917038360065?text=Hello%20Prathmesh'),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0xFF64FFDA),
        size: 24,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: const Color(0xFF64FFDA).withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1a1f3a),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFF64FFDA).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: FaIcon(
          icon,
          color: const Color(0xFF64FFDA),
          size: 20,
        ),
      ),
    );
  }
}