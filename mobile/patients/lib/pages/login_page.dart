import 'package:flutter/material.dart';
import 'package:patients/components/auth_page_text.dart';
import 'package:patients/components/default_button.dart';
import 'package:patients/components/default_input_text.dart';
import 'package:patients/constants/paddings.dart';
import 'package:patients/constants/radius.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const AuthPageText(
              line1: 'Hello',
              line2: 'Welcome Back!',
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(pagePadding),
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: mediumRadius,
                    topRight: mediumRadius,
                  )),
              child: Expanded(
                child: Column(
                  children: [
                    DefaultInputText(
                      label: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      textController: _viewModel.emailController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DefaultInputText(
                      label: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textController: _viewModel.passwordController,
                      canToggleVisibility: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DefaultButton(
                      buttonText: 'Sign In',
                      onPressed: () => _viewModel.login(context),
                      width: 350,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () => _viewModel.navigateToSignUp(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary
                            )

                          ),
                          Text(
                            "Sign up!",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
