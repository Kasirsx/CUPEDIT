import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';
import '/core/constants/app_theme.dart';

class GeneralHomePageScaffold extends StatelessWidget {
  const GeneralHomePageScaffold({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: false,
        title: Text(
          "CUPEDIT",
          style: AppTheme.headline
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.new_releases_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: body ?? const SizedBox(),
      ),
    );
  }
}
