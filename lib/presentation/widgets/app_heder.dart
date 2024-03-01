import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeder extends StatelessWidget {
  const AppHeder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.4,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset(
            'assets/logo/logo.png',
            scale: 3.5,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          'InvestPRO',
          style: GoogleFonts.unbounded(
            fontSize: 23,
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 47, 47, 55),
          ),
        ),
      ],
    );
  }
}
