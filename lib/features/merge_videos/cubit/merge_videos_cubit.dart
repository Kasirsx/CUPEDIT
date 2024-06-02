import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:ffmpeg_kit_flutter/statistics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/core/constants/commands.dart';
import '/core/utils/navigation.dart';
import '/core/utils/shared_storage.dart';
import '/features/merge_videos/cubit/merge_videos_state.dart';

class MergeVideosCubit extends Cubit<MergeVideosState> {
  MergeVideosCubit({
    this.originalFile,
    required this.originalVideoDuration,
    required this.context,
  }) : super(InitialMergeVideos());

  final File? originalFile;
  final BuildContext context;

  int originalVideoDuration;
  late int videoDuration;

  int? sessionId;

  //video

  Future<void> selectVideo() async {
    final List<AssetEntity>? videos = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        requestType: RequestType.video,
        maxAssets: 1,
      ),
    );

    if (videos != null && videos.isNotEmpty) {
      for (AssetEntity asset in videos) {
        File? videoFile = await asset.file;
        if (videoFile != null) {
          print([originalFile!.path, videoFile.path]);
          print('Selected Asset Path: ${videoFile.path}');

          print(asset.duration);
          videoDuration = asset.duration * 1000;
          mergeVideos(SharedStorage.getVideoPath(), videoFile.path);
        }
      }
    }
  }

  Future<void> mergeVideos(String inputPath1, String inputPath2) async {
    final outputPath = await outPut();

    final String command = Commands.mergeVideosCommand(
      inputPath1: inputPath1,
      inputPath2: inputPath2,
      outPath: outputPath,
    );

    print(command);

    emit(LoadMergeVideos());
    print("LOADING LOADING LOADING LOADING LOADING LOADING LOADING MERGE");

    await FFmpegKit.executeAsync(
      command,
      (session) async {
        final returnCode = await session.getReturnCode();

        // final log = await session.getAllLogsAsString();
        // final failStackTrace = await session.getFailStackTrace();

        if (ReturnCode.isSuccess(returnCode)) {
          EasyLoading.dismiss();
          print(outputPath);

          SharedStorage.writeVideoPath(outputPath);

          Navigation.pop(context);

          print("SUCCESS: Video merged successfully at $outputPath");
          print("SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS MERGE");
          emit(SuccessMergeVideos());
        } else if (ReturnCode.isCancel(returnCode)) {
          print("CANCELLED: Video merging was cancelled.");
          emit(CancelMergeVideos());
          print("CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL MERGE");
        } else {
          print("ERROR: Failed to merge videos.");
          print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR MERGE");
          emit(ErrorMergeVideos());

          final failLog = await session.getFailStackTrace();
          print("FFmpeg Failure Log: $failLog");
        }
      },
      (log) {
        print(log.getSessionId());
        print(log.getMessage());
      },
      (statistics) {
        sessionId = statistics.getSessionId();
        //updateProgressDialog(statistics);
      },
    );
  }

  Future<void> cancelMergeVideos() async {
    FFmpegKit.cancel(sessionId);
  }

  void updateProgressDialog(Statistics? statistics) {
    emit(LoadMergeVideos());
    if (statistics == null || statistics.getTime() < 0) {
      return;
    }

    double timeInMilliseconds = statistics.getTime();
    print(timeInMilliseconds);
    print(originalVideoDuration + videoDuration);
    int completePercentage =
        (timeInMilliseconds * 100) ~/ originalVideoDuration + videoDuration;

    EasyLoading.show(status: "merging  $completePercentage% ");
  }

/*  String now() {
    final DateTime now = DateTime.now();
    return "${now.year}${now.month}${now.day}_${now.hour}${now.minute}${now.second}";
  }*/

  static Future<String?> outPut() async {
    final Directory tempDir = await getTemporaryDirectory();
    final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    final Directory? downloadsDir = await getDownloadsDirectory();
    final videoName = now().toString();
    return "${downloadsDir!.path}/merge$videoName.mp4";
  }

  static String now() {
    final DateTime now = DateTime.now();
    return "${now.year}_${now.month}_${now.day}_${now.hour}_${now.minute}";
  }
}
