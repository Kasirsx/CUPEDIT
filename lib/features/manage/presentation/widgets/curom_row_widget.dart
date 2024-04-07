import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../core/widgets/buttons/main_elevated_button.dart';
import '../../../../../../../../core/widgets/custom_image.dart';
import '../../../../core/constants/app_theme.dart';

class CustomRowWidget extends StatelessWidget {
  final String? image;
  final Widget? firstWidget;
  final Widget? secondWidget;

  const CustomRowWidget(
      {super.key, this.image, this.secondWidget, this.firstWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: image != null
                ? CustomImage.circular(
                    image: image,
                    svg: false,
                    isNetworkImage: false,
                    radius: 50,
                  )
                : SizedBox(),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              flex: 4, child: firstWidget != null ? firstWidget! : SizedBox()),
          Expanded(
              flex: 2,
              child: secondWidget != null ? secondWidget! : SizedBox()),
        ],
      ),
    );
  }
}
