import 'package:flutter/material.dart';
import 'package:hs_frontend/screens/log_in/widgets/log_in_footer.dart';
import 'package:hs_frontend/screens/log_in/widgets/log_in_form.dart';
import 'package:hs_frontend/screens/log_in/widgets/log_in_header.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Column(
        children: [
          SizedBox(height: height * 0.12),
          const LogInHeader(),
          SizedBox(height: height * 0.1),
          const LogInForm(),
          SizedBox(height: height * 0.12),
          const LogInFooter(),
        ],
      ),
    );
  }
}
