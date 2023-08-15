import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/sign_up/widgets/sign_up_footer.dart';
import 'package:hs_frontend/screens/sign_up/widgets/sign_up_form.dart';
import 'package:hs_frontend/screens/sign_up/widgets/sign_up_header.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),
            const SignUpHeader(),
            SizedBox(height: height * 0.07),
            const SignUpForm(),
            SizedBox(height: height * 0.03),
            const SignUpFooter(),
          ],
        ),
      ),
    );
  }
}
