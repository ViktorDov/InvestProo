import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investpro/presentation/widgets/app_heder.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, top: 16, right: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeder(),
              const SizedBox(height: 32),
              Text(
                'Еженедельные советы',
                style: GoogleFonts.unbounded(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TipsWeeklyPage extends StatefulWidget {
  const TipsWeeklyPage({super.key});

  @override
  State<TipsWeeklyPage> createState() => _TipsWeeklyPageState();
}

class _TipsWeeklyPageState extends State<TipsWeeklyPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}