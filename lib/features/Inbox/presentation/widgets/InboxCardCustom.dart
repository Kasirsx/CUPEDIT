import 'package:cupcat/core/constants/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';

class InboxCardCustom extends StatelessWidget {
  final String? date;
  final String? title;
  final String? subtitle;

  const InboxCardCustom({
    Key? key,
    this.date,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0, // Set elevation to 0.0

      color: AppColors.white, // Set the desired background color

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.cut),
                Expanded(
                  child: Text("system_notification".tr(),
                      style: AppTheme.headline3),
                ),
                Text(
                  date != null ? date! : "",
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(title != null ? title! : "", style: AppTheme.headline6),
            SizedBox(
              height: 10,
            ),
            Text(subtitle != null ? subtitle! : "",
                style: AppTheme.bodySmall.copyWith(color: AppColors.grey)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("view_more".tr(), style: AppTheme.bodyText1),
                Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
