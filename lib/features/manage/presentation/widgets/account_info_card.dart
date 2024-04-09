import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../core/constants/app_theme.dart';
import '../../../profile/presentation/widgets/custom_column.dart';

class AccountInfoCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? mainTitle;
  final Widget? icon;

  AccountInfoCard(
      {required this.title, required this.subTitle, this.mainTitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:EdgeInsets.symmetric(vertical:20 ) ,
          child: Text(
            mainTitle == null ? "" : mainTitle!,
            style: AppTheme.headline6.copyWith(color: AppColors.grey60),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomColumn(
              title: title == null ? "" : title!,
              subTitle: subTitle == null ? "" : subTitle!,
            ),
            Icon(Icons.arrow_forward_ios_sharp),
          ],
        ),
      ],
    );
  }
}
