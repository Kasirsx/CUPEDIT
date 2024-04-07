import 'package:flutter/material.dart';

import '../../../../../core/constants/app_theme.dart';

class CustomRow extends StatelessWidget {
  final Widget? leadingIcon;
  final String text;
  final Widget? trailingIcon;

  CustomRow({this.leadingIcon, required this.text, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      child: Row(
        children: [
          if (leadingIcon != null) leadingIcon!,
          SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: AppTheme.bodyText1,
          ),
          SizedBox(
            width: 6,
          ),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
