import 'package:flutter/material.dart';

class DefaultInputText extends StatefulWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final bool canToggleVisibility; 

  const DefaultInputText({
    super.key, 
    required this.label,
    this.keyboardType = TextInputType.text, 
    required this.textController,
    this.canToggleVisibility = false
  });

  @override
  State<DefaultInputText> createState() => _DefaultInputTextState();
}

class _DefaultInputTextState extends State<DefaultInputText> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.canToggleVisibility;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.label,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        hintText: 'E-mail',
        suffixIcon: widget.canToggleVisibility ? GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ) : null
        
      ),
    );
  }
}