import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hs_frontend/screens/sign_up/screen/sign_up_screen.dart';

class LogInFooter extends StatelessWidget {
  const LogInFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have An Account?",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            'Sign Up !!!',
            style: GoogleFonts.poppins(
              color: Colors.teal,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
