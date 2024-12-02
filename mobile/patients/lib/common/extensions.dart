import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension DateTimeFormatting on DateTime {
  String localeFormat(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final pattern = DateFormat.yMd(locale).add_Hm().pattern;
    return DateFormat(pattern, locale).format(this);
  }
}