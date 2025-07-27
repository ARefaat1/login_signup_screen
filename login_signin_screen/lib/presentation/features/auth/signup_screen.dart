import 'package:flutter/material.dart';
import 'package:login_signin_screen/core/theme/constants.dart';
import 'package:login_signin_screen/presentation/widgets/app_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: Colors.deepPurple.shade100,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 AppTextField(
                  controller: TextEditingController(),
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(Icons.person),
                ),
                spaceBox,
                // email text field
                AppTextField(
                  controller: TextEditingController(),
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                ),
                spaceBox,
                // password text field
                AppTextField(
                  controller: TextEditingController(),
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                ),
                spaceBox,
                // confirm password text field
                AppTextField(
                  controller: TextEditingController(),
                  hintText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                ),
                spaceBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
