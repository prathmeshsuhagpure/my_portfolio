import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onSkillsPressed;
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomNavBar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onSkillsPressed,
    required this.onProjectsPressed,
    required this.onContactPressed,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*const Text(
            '<Dev/>',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF64FFDA),
            ),
          ),*/

          if (isDesktop)
            Row(
              children: [
                NavItem(label: 'Home', onPressed: onHomePressed),
                NavItem(label: 'About', onPressed: onAboutPressed),
                NavItem(label: 'Skills', onPressed: onSkillsPressed),
                NavItem(label: 'Projects', onPressed: onProjectsPressed),
                NavItem(label: 'Contact', onPressed: onContactPressed),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu_rounded, color: Color(0xFF64FFDA)),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
        ],
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const NavItem({super.key, required this.label, required this.onPressed});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? const Color(0xFF64FFDA) : Colors.white70,
              fontSize: 16,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

