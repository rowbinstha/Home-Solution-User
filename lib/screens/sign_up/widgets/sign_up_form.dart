// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hs_frontend/services/sign_up_service.dart';
import 'package:hs_frontend/utils/utils.dart';
import 'package:hs_frontend/widgets/custom_button.dart';
import 'package:hs_frontend/widgets/custom_text_form.dart';
import 'package:hs_frontend/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ChangeNotifierProvider(
        create: (_) => SignUpService(),
        child: Consumer<SignUpService>(
          builder: (context, provider, child) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField1(
                    hintText: 'Username',
                    prefixIcon: Icons.supervised_user_circle_outlined,
                    controller: _userNameController,
                    focusNode: userNameFocusNode,
                    onFieldSubmittedValue: (value) {},
                    onValidator: (value) {
                      return value.isEmpty ? 'Enter Username' : null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField1(
                    hintText: 'Email Address',
                    prefixIcon: Icons.email_outlined,
                    controller: _emailController,
                    focusNode: emailFocusNode,
                    onFieldSubmittedValue: (value) {
                      Utils.fieldFocus(
                          context, emailFocusNode, passwordFocusNode);
                    },
                    onValidator: (value) {
                      return value.isEmpty ? 'Enter email address' : null;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    hintText: 'Password',
                    prefixIcon: Icons.key_off,
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    onFieldSubmittedValue: (value) {},
                    onValidator: (value) {
                      return value.isEmpty ? 'Enter password' : null;
                    },
                    obscureText: _isObscure,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    loading: provider.loading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        provider.signUp(
                          context,
                          _userNameController.text,
                          _emailController.text,
                          _passwordController.text,
                        );
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) {
                        //       return const LogInScreen();
                        //     },
                        //   ),
                        // );
                      }
                    },
                    buttonName: 'Sign Up',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
