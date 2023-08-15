import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Welcome \nBack',
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
