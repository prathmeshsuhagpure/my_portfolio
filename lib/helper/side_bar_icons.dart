// Vertical Social Bar
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'animation.dart';

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