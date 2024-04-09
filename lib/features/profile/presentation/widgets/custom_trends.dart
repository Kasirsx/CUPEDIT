import 'package:cupcat/features/profile/presentation/widgets/trend_custom_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_theme.dart';
import '../../data/trend_model.dart';

class CustomTrends extends StatelessWidget {
  String jsonString = '[{"title": "luna", "followers": "1000","image": '
      '"${AppAssets.profileTikTok}"},'
      ' {"title": "sun", "followers": "2000","image": '
      '"${AppAssets.profileTikTok}"}, '
      '{"title": "star", "followers": "3000","image":'
      ' "${AppAssets.profileTikTok}"}]';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Text(
              "trending_creators".tr(),
              style: AppTheme.bodyText1,
            )),
            Text(
              "view_more".tr(),
              style: AppTheme.bodySmall,
            ),
            SizedBox(
              width: 3,
            ),
            Icon(
              size: 10,
              Icons.arrow_forward_ios_sharp,
              color: AppColors.grey60,
            ),
          ]),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 172,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              final trendsList = getTrendModelFromJson(jsonString);
              final trend = trendsList[index];
              return TrendCustomCard(
                trendModel: trend!,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return VerticalDivider(
                width: 8,
              );
            },
          ),
        ),
      ],
    );
  }
}
