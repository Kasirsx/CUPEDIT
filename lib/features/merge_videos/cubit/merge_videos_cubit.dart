// import 'dart:io';
//
// import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
// import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
// import 'package:ffmpeg_kit_flutter/return_code.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:wechat_assets_picker/wechat_assets_picker.dart';
//
// import '/features/merge_videos/cubit/merge_videos_state.dart';
//
// class MergeVideosCubit extends Cubit<MergeVideosState> {
//   MergeVideosCubit(
//     this.originalFile,
//   ) : super(InitialMergeVideos());
//   final File? originalFile;
//
//   Future<void> selectVideo(BuildContext context) async {
//     final List<AssetEntity>? videos = await AssetPicker.pickAssets(
//       context,
//       pickerConfig: const AssetPickerConfig(
//         requestType: RequestType.video,
//       ),
//     );
//     if (videos != null && videos.isNotEmpty) {
//       for (AssetEntity asset in videos) {
//         File? path = await asset.file;
//         if (path != null) {
//           print(path.path);
//           List<File> videoFiles = [
//             path,
//             originalFile!,
//           ];
//           //mergeVideos(videoFiles);
//           //merge(path);
//
//           //mergeVideos(originalFile!.path, path.path, outputPath);
//           sss(originalFile!.path, path.path);
//           print('Selected Asset Path: $path');
//         }
//       }
//     }
//   }
//
//   final String outputPath = "/storage/emulated/0/video.mp4";
//   String timeLimit = '00:00:';
//
//   // void merge(File mergeFile) {
//   //   final String command =
//   //
//   //
//   // '-i ${originalFile!.path}.mp4 -c:v mpeg4 ${mergeFile.path}.mp4';
//   //       '-r 15 -f mp4 -i ${originalFile!.path} -f mp3 -i ${mergeFile.path} -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 -t $timeLimit -y ${outputPath}';
//   //   // '-i ${originalFile!.path} -i ${mergeFile.path} -filter_complex "concat=n=2:v=1:a=1" -c:v libx264 -preset ultrafast -c:a aac -b:a 192k $outputPath';
//   //   print(command);
//   //   FFmpegKit.executeAsync(command).then((session) async {
//   //     final returnCode = await session.getReturnCode();
//   //     emit(LoadMergeVideos());
//   //     print("LOADING LOADING LOADING LOADING LOADING LOADING LOADING MERGE");
//   //     if (ReturnCode.isSuccess(returnCode)) {
//   //       // SUCCESS
//   //       emit(SuccessMergeVideos());
//   //       print("SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS MERGE");
//   //     } else if (ReturnCode.isCancel(returnCode)) {
//   //       // CANCEL
//   //       emit(CancelMergeVideos());
//   //       print("CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL MERGE");
//   //     } else {
//   //       // ERROR
//   //       emit(ErrorMergeVideos());
//   //       print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR MERGE");
//   //     }
//   //   });
//   // }
//
// /*  Future<void> mergeVideos(String inputPath1, String inputPath2, String outputPath) async {
//     String command = '-i $inputPath1 -i $inputPath2 -filter_complex "[0:v][0:a][1:v][1:a] concat=n=2:v=1:a=1[outv] [outa]" -map "[outv]" -map "[outa]" $outputPath';
//
//     await FFmpegKit.executeAsync(command).then((session) async {
//       final ReturnCode? returnCode = await session.getReturnCode();
//
//       if (ReturnCode.isSuccess(returnCode)) {
//         print("SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS MERGE");
//       } else {
//         print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR MERGE");
//         // Get detailed FFmpeg output for debugging
//         final outputs = await session.getAllStatistics();
//         print("FFmpeg Output:\n$outputs");
//       }
//     });
//   }*/
//
//   String now() {
//     var now = DateTime.now();
//     return "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}.${now.millisecond}";
//   }
//
//   void ffprint(String text) {
//     final pattern = RegExp('.{1,900}');
//     var nowString = now();
//     pattern
//         .allMatches(text)
//         .forEach((match) => print("$nowString - " + match.group(0)!));
//   }
//
//   sss(var file1, var file2) {
//
//
//     String command = "-i $file1.mp4 -vf scale=-1:480 -c:v libx264 -crf 28 output.mp4";
//
//     ffprint(
//         "FFmpeg process started with arguments: \'${command}\'.");
//
//     FFmpegKit.executeAsync(
//         command,
//             (session) async {
//           final returnCode = await session.getReturnCode();
//           final failStackTrace = await session.getFailStackTrace();
//
//           emit(LoadMergeVideos());
//           print(command);
//           print(returnCode);
//           print("LOADING LOADING LOADING LOADING LOADING LOADING LOADING MERGE");
//
//           if (ReturnCode.isSuccess(returnCode)) {
//             emit(SuccessMergeVideos());
//             print("SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS MERGE");
//
//             // SUCCESS
//           } else if (ReturnCode.isCancel(returnCode)) {
//             // CANCEL
//             emit(CancelMergeVideos());
//             print("CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL MERGE");
//           } else {
//             emit(ErrorMergeVideos());
//             print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR MERGE");
//
//             // ERROR
//           }
//         }).then((session) => ffprint(
//         "Async FFmpeg process started with sessionId ${session.getSessionId()}."));
//   }
// }

import 'dart:io';

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '/features/merge_videos/cubit/merge_videos_state.dart';

class MergeVideosCubit extends Cubit<MergeVideosState> {
  MergeVideosCubit(this.originalFile,) : super(InitialMergeVideos());
  final File? originalFile;



  Future<void> selectVideo(BuildContext context) async {
    final List<AssetEntity>? videos = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(requestType: RequestType.video),
    );

    if (videos != null && videos.isNotEmpty) {
      for (AssetEntity asset in videos) {
        File? videoFile = await asset.file;
        if (videoFile != null) {
          print('Selected Asset Path: ${videoFile.path}');
          mergeVideos(originalFile!.path, videoFile.path);
        }
      }
    }
  }

  Future<void> mergeVideos(String inputPath1, String inputPath2) async {
    final String outputPath = "/storage/emulated/0/merged_video_${now()}.mp4";
    // final String command =
    //     '-i $inputPath1 -i $inputPath2 -filter_complex "[0:v][0:a][1:v][1:a] concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -y $outputPath';
   /* final String command =
        '-i $inputPath1 -i $inputPath2 -filter_complex "[0:v][1:v]concat=n=2:v=1:a=0[outv]" -map "[outv]" -y $outputPath';
*/

    final String command =
        '-i "$inputPath1" -i "$inputPath2" '
        '[0:v] [0:a] [1:v] [1:a] concat=n=2:v=1:a=1 [outv] [outa] -map "[outv]" -map "[outa]" -y "$outputPath"';


    print("FFmpeg process starting with command: $command");
    print(command);
    print("LOADING LOADING LOADING LOADING LOADING LOADING LOADING MERGE");
    emit(LoadMergeVideos());



    await FFmpegKit.executeAsync(command, (session) async {
      final returnCode = await session.getReturnCode();
      await session.getSessionId();
      print(await session.getSessionId());
      if (ReturnCode.isSuccess(returnCode)) {
        print("SUCCESS: Video merged successfully at $outputPath");
        print("SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS SUCCESS MERGE");
        emit(SuccessMergeVideos());
      } else if (ReturnCode.isCancel(returnCode)) {
        print("CANCELLED: Video merging was cancelled.");
        print("CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL CANCEL MERGE");
        emit(CancelMergeVideos());
      } else {
        print("ERROR: Failed to merge videos.");
        print("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR MERGE");
        emit(ErrorMergeVideos());

        final failLog = await session.getFailStackTrace();

        print("FFmpeg Failure Log: $failLog");
      }
    });
  }


  String now() {
    final DateTime now = DateTime.now();
    return "${now.year}${now.month}${now.day}_${now.hour}${now.minute}${now.second}";
  }
}







