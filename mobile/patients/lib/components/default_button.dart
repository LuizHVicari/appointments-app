import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  const DefaultButton({super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.primaryContainer),
        foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimaryContainer),
        
      ), 
      child: Text(buttonText),
    );
  }
}