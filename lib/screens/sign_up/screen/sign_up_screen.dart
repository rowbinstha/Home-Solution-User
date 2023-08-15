import 'package:flutter/material.dart';
import 'package:hs_frontend/components/background.dart';
import 'package:hs_frontend/screens/sign_up/widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFE0F2F1),
      body: SizedBox(
        child: Background(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: const SingleChildScrollView(
              child: SignUpBody(),
            ),
          ),
        ),
      ),
    );
  }
}
