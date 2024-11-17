import 'package:flutter/material.dart';

class DefaultInputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;

  const DefaultInputText({
    super.key, 
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false

    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        hintText: 'E-mail'
        
      ),
    );
  }
}