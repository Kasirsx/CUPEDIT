import 'package:cupcat/core/constants/app_assets.dart';
import 'package:cupcat/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';

import '/core/constants/app_colors.dart';

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
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: body ?? const SizedBox(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.black,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.cancel_outlined,
          color: AppColors.white,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.help_outline,
              color: AppColors.white,
            ),
          ),
          Container(
            width: 50,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomImage.rectangle(
              image: AppAssets.saveEditImageOrVideoNewProject,
              isNetworkImage: false,
              svg: false,
              width: 20.0,
              height: 22.0,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
