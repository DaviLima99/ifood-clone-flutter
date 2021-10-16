import 'package:flutter/material.dart';

class AppTypography {
  static TextStyle? bodyText(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1;
  }

  static TextStyle bodyTextBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle tabBarStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      color: Colors.black, fontWeight: FontWeight.w600
    );
  }

  static TextStyle localTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      fontWeight: FontWeight.w700,
      fontSize: 13
    );
  }
}