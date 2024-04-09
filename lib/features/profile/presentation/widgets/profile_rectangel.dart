import 'package:cupcat/core/constants/app_assets.dart';
import 'package:cupcat/core/constants/app_colors.dart';
import 'package:cupcat/core/constants/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileRectangle extends StatelessWidget {
  const ProfileRectangle({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          gradient: AppColors.ProfilCardGradinet,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: InkWell(
            onTap: onTap,
            child: Text(
              "join_cupedit_pro".tr(),
              style: AppTheme.headline6.copyWith(
                color: AppColors.black,
                fontSize: 9.5,
              ),
            ),
          ),
        ));
  }
}
