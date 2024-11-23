import 'package:flutter/material.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/view_models/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel();
  }

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
            DefaultInputText(
              label: 'E-mail', 
              keyboardType: TextInputType.emailAddress,
              textController: _viewModel.emailController,
            ),
            const SizedBox(height: 8,),
            DefaultInputText(
              label: 'Password', 
              keyboardType: TextInputType.visiblePassword,
              textController: _viewModel.passwordController,
              canToggleVisibility: true,
            ),
            DefaultButton(
              buttonText: 'Sign In', 
              onPressed: () => _viewModel.login(context)
            ),
            const Text("Don't have an account?"),
            DefaultButton(
              buttonText: 'Sign Up', 
              onPressed: () => _viewModel.navigateToSignUp(context)
            ), 
          ],
        ),
      ),
    );
  }
}