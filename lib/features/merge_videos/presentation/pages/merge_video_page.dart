import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/constants/app_colors.dart';
import '/core/widgets/buttons/main_elevated_button.dart';

class MergeVideosPage extends StatelessWidget {
  const MergeVideosPage({
    super.key,
    this.originalFile,
  });

  final File? originalFile;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: size * 0.45,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainElevatedButton(
            buttonColor: AppColors.black12,
            onPressed: () {
              _selectVideo(context);
            },
            text: "select_video",
          ),
        ],
      ),
    );
  }

  Future<void> _selectVideo(BuildContext context) async {
    final List<AssetEntity>? videos = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        requestType: RequestType.video,
      ),
    );
    if (videos != null && videos.isNotEmpty) {
      for (AssetEntity asset in videos) {
        File? path = await asset.file;
        if (path != null) {
          print(path.path);
          merge(path);
          print('Selected Asset Path: $path');
        }
      }
    }
  }

  void merge(File mergeFile) {
    FFmpegKit.execute(
            '-i ${originalFile!.path}.mp4 -c:v mpeg4 ${mergeFile.path}.mp4')
        .then((session) async {
      final returnCode = await session.getReturnCode();
      print("+++++++++++++++++++111111111111111111");
      if (ReturnCode.isSuccess(returnCode)) {
        // SUCCESS
        print("SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS MERGE");
      } else if (ReturnCode.isCancel(returnCode)) {
        // CANCEL
        print("CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL MERGE");
      } else {
        // ERROR
        print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR MERGE");
      }
    });

    print("objectfffffffffffffff");
  }
}
