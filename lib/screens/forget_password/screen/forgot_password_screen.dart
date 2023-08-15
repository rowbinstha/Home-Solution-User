import 'package:flutter/material.dart';
import 'package:hs_frontend/components/background.dart';
import 'package:hs_frontend/screens/forget_password/widgets/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFE0F2F1),
      body: Background(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const SingleChildScrollView(
            child: ForgotPasswordBody(),
          ),
        ),
      ),
    );
  }
}
