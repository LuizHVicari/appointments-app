import 'package:flutter/material.dart';
import 'package:patients/components/auth_page_text.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/constants/radius.dart';
import 'package:patients/view_models/sign_up_view_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final SignUpViewModel _viewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const AuthPageText(
              line1: 'Welcome', line2: 'Sign Up Now!',
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(pagePadding),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.only(
                  topLeft: mediumRadius, 
                  topRight: mediumRadius,
                )
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultInputText(
                      label: 'E-mail', 
                      keyboardType: TextInputType.emailAddress,
                      textController: _viewModel.emailController,
                    ),
                    const SizedBox(height: 8,),
                    DefaultInputText(
                      label: 'Name', 
                      keyboardType: TextInputType.name,
                      textController: _viewModel.nameController,
                    ),
                    const SizedBox(height: 8,),
                    DefaultInputText(
                      label: 'Password', 
                      keyboardType: TextInputType.visiblePassword,
                      textController: _viewModel.passwordController,
                      canToggleVisibility: true,
                    ),
                    const SizedBox(height: 8,),
                    DefaultInputText(
                      label: 'Confirm password', 
                      keyboardType: TextInputType.visiblePassword,
                      textController: _viewModel.confirmPasswordController,
                      canToggleVisibility: true,
                    ),
                    const SizedBox(height: 24,),
                    DefaultButton(
                      buttonText: 'Create account', 
                      onPressed: () => _viewModel.login(context),
                      width: 350,
                    ),
                    const SizedBox(height: 16,),
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Already have an account? "),
                          Text(
                            "Sign in!",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text('Password must be at least 8 characters long'),
                    const Text('Password must contain one lower case character'),
                    const Text('Password must contain one upper case character'),
                    const Text('Password must contain one special character'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}