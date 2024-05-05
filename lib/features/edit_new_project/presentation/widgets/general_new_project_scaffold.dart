import 'package:flutter/material.dart';

//import 'wechat_assets_picker/src/delegates/asset_picker_builder_delegate.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/utils/navigation.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/presentation/pages/homeScreen.dart';

class GeneralNewProjectScaffold extends StatelessWidget {
  const GeneralNewProjectScaffold({
    super.key,
    this.body,
    this.index,
    this.horizontal = 0,
    this.vertical = 0,
  });

  final Widget? body;
  final double vertical;
  final double horizontal;

  final int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black12,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: body ?? const SizedBox(),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    switch (index) {
      case 0:
        return AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.black12,
          leading: IconButton(
            onPressed: () {
              Navigation.pushAndRemoveUntil(context, const HomeScreen());
            },
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
                icon: const Icon(
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
        break;
      case 1:
        return AppBar();
        break;
    }
    return null;
  }
}
