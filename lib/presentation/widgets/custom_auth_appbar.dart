import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_size.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400]!,
                blurRadius: 5.0,
                offset: const Offset(-2.0, 5.0),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/icons/back_arrow.svg',
              height: 24,
            ),
          ),
        ),
        SizedBox(width: AppSize.myHeight(context) * .11),
        Text(
          'Вход',
          style: GoogleFonts.unbounded(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
