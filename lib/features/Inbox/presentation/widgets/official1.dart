import 'package:flutter/material.dart';

import '../../../../../../../core/constants/app_colors.dart';
import 'InboxCardCustom.dart';
import 'official_list_items.dart';

class CapCutOfficial extends StatelessWidget {
  List<String> titles = [
    'Retouch features just got better on CapCuts desktop app',
    'Retouch features just got better on CapCuts desktop app',
    'Retouch features just got better on CapCuts desktop app'
  ];

  List<String> subtitles = [
    'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !',
    'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !',
    'try feature lke retouch ,reshap and makeup to add extra polish to your creations.download the CapCute desktop app and see for your self now !'
  ];
  List<String> dates = ['3:14', '5:15', '3:13'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey50,
      child:
          OfiicialListItems(titles: titles, subtitles: subtitles, dates: dates),
    );
  }
}
