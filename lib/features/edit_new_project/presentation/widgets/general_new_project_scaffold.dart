import 'package:cupcat/core/constants/app_theme.dart';
import 'package:cupcat/core/utils/shared_storage.dart';
import 'package:cupcat/features/Video_quality/presentations/widgets/change_video_quality.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/constants/app_assets.dart';
import '/core/constants/app_colors.dart';
import '/core/widgets/custom_image.dart';
import '/features/home/presentation/pages/homeScreen.dart';

class GeneralNewProjectScaffold extends StatefulWidget {
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
  State<GeneralNewProjectScaffold> createState() =>
      _GeneralNewProjectScaffoldState();
}

class _GeneralNewProjectScaffoldState extends State<GeneralNewProjectScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black12,
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.vertical, horizontal: widget.horizontal),
        child: widget.body ?? const SizedBox(),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    String? quality;


    switch (SharedStorage.getVideoQuality()) {
      case 300:
        setState(() {


          quality=("144p");
        });

        break;
      case 500:
        setState(() {

          quality=("240p");

        });

        break;
      case 1000:
        setState(() {

          quality=("360p");

        });

        break;
      case 1500:
        setState(() {

          quality=("480p");

        });

        break;
      case 3000:
        setState(() {

          quality=("720p");

        });

        break;
      case 5000:
        setState(() {

          quality=("1080p");

        });

        break;
      case 8000:
        setState(() {

          quality=("1440p");

        });

        break;
      case 16000:
        setState(() {

          quality=("2kp");

        });

        break;
    }


    switch (widget.index) {
      case 0:
        return AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.black12,
          leading: IconButton(
            onPressed: () {
              EasyLoading.showToast(
                "your_project_has_been_saved_successfully".tr(),
                duration: const Duration(seconds: 1),
                maskType: EasyLoadingMaskType.black,
                toastPosition: EasyLoadingToastPosition.bottom,
              );
              AnimationNavigation.fadePushAndRemoveUntil(
                  context, const HomeScreen());
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ChangeVideoQuality(
                        quality: (value) {
                          setState(() {
                            quality = value;
                          });
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.greyTest,
                  ),
                  child: Center(
                    child: Text(
                      "${quality}",
                      style: AppTheme.headline5.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
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

      case 1:
        return AppBar();
    }
    return null;
  }
}
