import 'package:flutter/material.dart';
import 'package:hs_frontend/components/background.dart';
import 'package:hs_frontend/screens/log_in/widgets/log_in_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

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
            child: LogInBody(),
          ),
        ),
      ),
    );
  }
}
