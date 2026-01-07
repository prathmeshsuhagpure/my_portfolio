// Section Title Widget
import 'package:flutter/material.dart';
import 'package:portfolio_web_app/helper/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final double fontSize = Responsive.getResponsiveValue(
      context,
      mobile: 22,
      tablet: 26,
      desktop: 32,
    );

    return Row(
      children: [
        Text(
          '< ',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF64FFDA),
          ),
        ),

        Flexible(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),

        Text(
          ' />',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF64FFDA),
          ),
        ),

        if (!Responsive.isMobile(context)) // optional UX improvement
          Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF64FFDA),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}