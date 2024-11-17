import 'package:flutter/material.dart';
import 'package:patients/constants/font_sizes.dart';

class InformationRow extends StatelessWidget {

  final String label;
  final String info;


  const InformationRow({super.key, required this.label, required this.info});

  @override
  Widget build(BuildContext context) {
    return Wrap( 
      children: [ 
        Text( 
          '$label: ', 
          style: const TextStyle(fontSize: fontMedium)), 
        Text(
          info, 
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: fontMedium,
          )
        ),
      ]
    );
  }
}