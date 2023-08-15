// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hs_frontend/screens/forget_password/screen/forgot_password_screen.dart';
import 'package:hs_frontend/services/log_in_service.dart';
import 'package:hs_frontend/widgets/custom_button.dart';
import 'package:hs_frontend/widgets/custom_text_form.dart';
import 'package:hs_frontend/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  bool _passVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField1(
            hintText: 'Email Address',
            prefixIcon: Icons.email_outlined,
            controller: _emailController,
            focusNode: emailFocusNode,
            onFieldSubmittedValue: (value) {},
            onValidator: (value) {
              return value.isEmpty ? 'Enter email address' : null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'Password',
            prefixIcon: Icons.key_off,
            controller: _passwordController,
            focusNode: passwordFocusNode,
            onFieldSubmittedValue: (value) {},
            onValidator: (value) {
              return value.isEmpty ? 'Enter password' : null;
            },
            obscureText: _passVisibility,
            suffixIcon: IconButton(
              icon: _passVisibility
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: () {
                _passVisibility = !_passVisibility;

                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 35),
          ChangeNotifierProvider(
            create: (_) => LogInService(),
            child: Consumer<LogInService>(builder: (context, provider, child) {
              return CustomButton(
                loading: provider.loading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    provider.login(context, _emailController.text,
                        _passwordController.text);
                  }
                },
                buttonName: 'Log In',
              );
            }),
          ),
          const SizedBox(height: 25),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const ForgotPasswordScreen(),
                ),
              );
            },
            child: Text(
              'Forgot Password? 🤔',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
