import 'package:flutter/material.dart';
import 'package:login_signin_screen/core/theme/constants.dart';
// import 'package:login_signin_screen/presentation/widgets/app_button.dart';
import 'package:login_signin_screen/presentation/widgets/app_textfield.dart';
import 'signup_screen.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
          backgroundColor: Colors.deepPurple.shade100,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // login button
                    ElevatedButton(
                      onPressed: () {
                        print('Login button pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text("Don't have an account? Sign up"),
                    ),

                    // signup button
                    // ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
