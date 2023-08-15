import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hs_frontend/screens/log_in/screen/log_in_screen.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Colors.teal,
                thickness: 1,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'or',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Divider(
                color: Colors.teal,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.009),
        Text(
          'Sign Up With',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        SizedBox(height: height * 0.006),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already Have An Account?',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LogInScreen(),
                  ),
                );
              },
              child: Text(
                ' Sign In',
                style: GoogleFonts.poppins(
                  color: Colors.teal,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
