// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hs_frontend/services/forgot_password_service.dart';
import 'package:hs_frontend/widgets/custom_button.dart';
import 'package:hs_frontend/widgets/custom_text_form.dart';
import 'package:provider/provider.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Enter your email address \nto recover your password',
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          const SizedBox(height: 25),
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
          const SizedBox(height: 35),
          ChangeNotifierProvider(
            create: (_) => ForgotPasswordService(),
            child: Consumer<ForgotPasswordService>(
                builder: (context, provider, child) {
              return CustomButton(
                loading: provider.loading,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    provider.forgotPassword(
                      context,
                      _emailController.text,
                    );
                  }
                },
                buttonName: 'Recover',
              );
            }),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
