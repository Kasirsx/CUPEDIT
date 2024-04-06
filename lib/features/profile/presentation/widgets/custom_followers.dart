import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'custom_column.dart';

class CustomFollowersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CustomColumn(
            title: '0',
            subTitle: 'followers'.tr(),
          ),
          SizedBox(width: 22),
          CustomColumn(
            title: '1',
            subTitle: 'following'.tr(),
          ),
        ],
      ),
    );
  }
}
