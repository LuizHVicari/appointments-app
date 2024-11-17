import 'package:flutter/material.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/paddings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DefaultInputText(
              label: 'E-mail', 
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 8,),
            const DefaultInputText(
              label: 'Password', 
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            DefaultButton(
              buttonText: 'Sign In', 
              onPressed: () => Navigator.pushReplacementNamed(context, '/home')
            ),
            const Text("Don't have an account?"),
            DefaultButton(
              buttonText: 'Sign Up', 
              onPressed: () => Navigator.pushNamed(context, '/signUp')
            ), 
          ],
        ),
      ),
    );
  }
}