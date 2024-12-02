import 'package:flutter/material.dart';
import 'package:patients/constants/font_sizes.dart';

// ignore: must_be_immutable
class InformationRow extends StatelessWidget {

  final String label;
  final String info;
  double? fontSize;


  InformationRow({super.key, required this.label, required this.info, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Wrap( 
      children: [ 
        Text( 
          '$label: ', 
          style: TextStyle(fontSize: fontSize ?? fontMedium)), 
        Text(
          info, 
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: fontSize ?? fontMedium,
          )
        ),
      ]
    );
  }
}