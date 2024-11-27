import 'package:flutter/material.dart';
import 'package:patients/constants/font_sizes.dart';
import 'package:patients/constants/paddings.dart';

class AuthPageText extends StatelessWidget {
  final String line1;
  final String line2;
  const AuthPageText({super.key, required this.line1, required this.line2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(pagePadding),
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(
              fontSize: fontExtraBig,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary
            ),
          ),
          Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: fontExtraBig,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary
            ),
          ),
        ],
      ),
    );
  }
}