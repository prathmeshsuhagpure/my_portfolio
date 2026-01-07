import 'package:flutter/material.dart';
import '../helper/glowing_button.dart';
import '../helper/responsive.dart';
import '../helper/section_title.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.getResponsiveValue(
      context,
      mobile: 30,
      tablet: 50,
      desktop: 80,
    );

    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          const SectionTitle(title: 'Contact Me'),

          const SizedBox(height: 30),
          Text(
            'Have a project or idea? Let’s talk. I’d love to help.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 40),
          GlowingButton(
            text: 'Start a Conversation',
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'prathmeshsuhagpure3@gmail.com',
                query: 'subject=Hello&body=Hi%20Prathmesh',
              );

              if (!await launchUrl(emailLaunchUri)) {
                // Fallback to Gmail web
                final gmailUrl = Uri.parse(
                    'https://mail.google.com/mail/?view=cm&to=prathmeshsuhagpure3@gmail.com&su=Hello&body=Hi%20Prathmesh'
                );
                await launchUrl(gmailUrl, mode: LaunchMode.externalApplication);
              }
            },
            isPrimary: true,
          )

        ],
      ),
    );
  }
}
