import 'package:cupcat/features/setting/widgets/custom_switch_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_theme.dart';
import '../../../../../../core/widgets/text_switch.dart';
import '../widgets/custom_icon_widget.dart';
import '../widgets/setting_card_custom.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      color: AppColors.white,
      child: ListView(
        children: [
          SettingCardCustom(
            title: "add_default_ending".tr(),
            widget: CustomSwitchWidget(),
          ),
          SettingCardCustom(
            title: "add_default_ending".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "auto_upload".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "feedback".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "cupedit_community_guidelines".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "terms_of_service".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "privacy_policy".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "open_source_software_notice".tr(),
            widget: CustomIconWidget(
              onTap: () {},
            ),
          ),
          SettingCardCustom(
            title: "clear_cache".tr(),
            widget: Text(
              "975.68M",
              style: AppTheme.bodySmall.copyWith(color: AppColors.black),
            ),
          ),
          SettingCardCustom(
            title: "version".tr(),
            widget: Text(
              "1",
              style: AppTheme.bodySmall.copyWith(color: AppColors.black),
            ),
          ),
        ]
            .map(
              (e) => Padding(
                padding: const EdgeInsets.all(8),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}