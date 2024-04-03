import '/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class GeneralNewProjectScaffold extends StatelessWidget {
  const GeneralNewProjectScaffold({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: body ?? const SizedBox(),
      ),
    );
  }
}
