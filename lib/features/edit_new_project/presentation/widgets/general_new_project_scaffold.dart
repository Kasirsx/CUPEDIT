import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//import 'wechat_assets_picker/src/delegates/asset_picker_builder_delegate.dart';

import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/utils/navigation.dart';
import '/core/widgets/custom_image.dart';

class GeneralNewProjectScaffold extends StatelessWidget {
  const GeneralNewProjectScaffold({
    super.key,
    this.body,
    this.index,
  });

  final Widget? body;

  final int? index;

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

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    switch (index) {
      case 0:
        return AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.black,
          leading: IconButton(
            onPressed: () {
              Navigation.pop(context);
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
