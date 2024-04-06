import 'package:cupcat/core/constants/app_theme.dart';
import 'package:cupcat/features/home/presentation/widgets/general_home_page_scaffold.dart';
import 'package:cupcat/features/manage/presentation/widgets/general_manage_scaffold.dart';
import 'package:cupcat/features/manage/presentation/widgets/curom_row_widget.dart';
import 'package:cupcat/features/profile/presentation/widgets/custom_column.dart';
import 'package:cupcat/features/setting/widgets/custom_switch_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../core/widgets/custom_image.dart';
import '../widgets/account_info_card.dart';
import '../widgets/custom_account_row.dart';

class ManageAcccount extends StatelessWidget {
  ManageAcccount();

  @override
  Widget build(BuildContext context) {
    return GeneralManageScaffold(
      backgroundColor: AppColors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 1),
        child: Column(
          children: [
            AccountInfoCard(
              mainTitle: "contact_information".tr(),
              title: "email".tr(),
              subTitle: "hhhh@gmail.com",
            ),
            AccountInfoCard(
              mainTitle: "security".tr(),
              title: "password".tr(),
              subTitle: "enter_the_password".tr(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              height: 15,
              color: AppColors.grey40,
            ),
            CustomRowAccount(
              image: AppAssets.tiktokIcon,
              widge: CustomColumn(
                title: "Tik tok",
                subTitle: "كاسر",
              ),
            ),
            CustomRowWidget(
              firstWidget: Text(
                "display_tik_tok_profile".tr(),
                style: AppTheme.headline6,
              ),
              secondWidget: Align(
                  alignment: Alignment.centerRight, child: CustomSwitchWidget()),
            ),
            CustomRowAccount(
              showLinkButton: true,
              image: AppAssets.googleIcon,
              widge: Text(
                "google".tr(),
                style: AppTheme.headline6,
              ),
            ),
            CustomRowAccount(
              showLinkButton: true,
              image: AppAssets.facebookIcon,
              widge: Text(
                "facebook".tr(),
                style: AppTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
