import 'package:cupcat/core/constants/app_theme.dart';
 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/animations/navigation_route_animation/navigation_route_animation.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/navigation.dart';
import '../../../setting/pages/setting.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      centerTitle: false,
      title: Text("cup_edit".tr(), style: AppTheme.headline6),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.new_releases_outlined,
          ),
        ),
        IconButton(
          onPressed: () {
            AnimationNavigation.slidePush(context, Setting());
          },
          icon: const Icon(
            Icons.settings,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
