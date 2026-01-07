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
