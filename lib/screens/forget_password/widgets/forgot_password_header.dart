import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Forgot \nPassword',
          textAlign: TextAlign.left,
          style: GoogleFonts.sansita(
            color: Colors.black,
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
