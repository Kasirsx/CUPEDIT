import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const CustomIconWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(Icons.chevron_right),
    );
  }
}
