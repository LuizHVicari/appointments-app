import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final double? width;
  const DefaultButton({super.key, required this.buttonText, required this.onPressed, this.width,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.tertiaryContainer),
          foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onTertiaryContainer),   
          elevation: const WidgetStatePropertyAll(2.0)     
        ), 
        child: Text(buttonText),
      ),
    );
  }
}