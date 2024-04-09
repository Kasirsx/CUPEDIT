import 'dart:io';

import 'package:cupcat/core/utils/navigation.dart';
import 'package:cupcat/features/edit_new_project/presentation/pages/edit_video.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/animations/fade_animation.dart';
import '/core/animations/navigation_route_animation/navigation_route_animation.dart';
import '/core/widgets/buttons/main_elevated_button.dart';
import '/features/edit_new_project/presentation/pages/edit_videos.dart';

class SelectAssetsType extends StatelessWidget {
  const SelectAssetsType({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      fadeDirection: FadeDirection.bottom,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.red,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainElevatedButton(
                  onPressed: () {
                    pickVideo(context, RequestType.video)
                        /*.then((value) => Navigation.pop(context))*/;
                  },
                  text: "videos",
                  isSmall: true,
                ),
                MainElevatedButton(
                  onPressed: () {
                    pickVideo(context, RequestType.image)
                        /*.then((value) => Navigation.pop(context))*/;
                  },
                  text: "images",
                  isSmall: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future pickVideo(BuildContext context, RequestType requestType) async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        requestType: requestType,

      ),
    );






    if (assets != null && assets.isNotEmpty) {
      for (AssetEntity asset in assets) {
        File? path = await asset.file;
        if (path != null) {
          print(path.path);
          AnimationNavigation.scalePush(
            context,
            EditVideos(
              file: File(path.path),
            ),
            //EditVideos(),
          );
          print('Selected Asset Path: $path');
        }
      }
    }




  }
}
