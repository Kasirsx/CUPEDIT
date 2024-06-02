import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '/core/utils/shared_storage.dart';

class Commands {
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

  static String mergeVideosCommand(
      {String? inputPath1, String? inputPath2, String? outPath}) {
    int videoQuality = SharedStorage.getVideoQuality();
    final String command =
        '-i $inputPath1 -i $inputPath2 -filter_complex "[0:v][0:a][1:v][1:a]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" -b:v ${videoQuality}k -y $outPath';

    return command;
  }
}