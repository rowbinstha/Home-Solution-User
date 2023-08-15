import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/forget_password/widgets/forgot_password_form.dart';
import 'package:hs_frontend/screens/forget_password/widgets/forgot_password_header.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          const ForgotPasswordHeader(),
          SizedBox(height: height * 0.1),
          const ForgotPasswordForm(),
          SizedBox(height: height * 0.1),
        ],
      ),
    );
  }
}
