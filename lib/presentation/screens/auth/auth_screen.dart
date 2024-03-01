import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:investpro/presentation/constants/app_colors.dart';
import 'package:investpro/presentation/constants/app_size.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Image(
                image: AssetImage('assets/logo/logo.png'),
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 40),
              Text(
                'InvestPRO',
                style: GoogleFonts.unbounded(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  shadows: <Shadow>[
                    const Shadow(
                      offset: Offset(0, 5.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(53, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.myHeight(context) * .23),
              const LoginButtonForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButtonForm extends StatelessWidget {
  const LoginButtonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppSize.myWidth(context) * .8,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Регистрация',
              style: GoogleFonts.inter(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Уже есть аккаунт?',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Войти',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
