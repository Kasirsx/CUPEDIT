import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_editor/video_editor.dart';

import '/features/edit_new_project/items_cubit/media_process_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaProcessCubit extends Cubit<MediaProcessState>{
  MediaProcessCubit(this.file,) :super(InitialProcess());
  File? file;


  final exportingProgress = ValueNotifier<double>(0.0);
  final isExporting = ValueNotifier<bool>(false);
  final double height = 60.0;


  late final VideoEditorController controller = VideoEditorController.file(
    file!,
    minDuration: const Duration(
      seconds: 1,
    ),
    maxDuration: const Duration(
      seconds: 25,
    ),
  );

  String formatter(Duration duration) => [
    duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
    duration.inSeconds.remainder(60).toString().padLeft(2, '0')
  ].join(":");

/*  void setVolume() {
    print("===============volume_mute===============");
    if (volumeMute == 100) {
      controller.video.setVolume(0);
      volumeMute = 0;
      isVolumeMute = true;
      emit(SetVolumeVoice());
    } else if (volumeMute == 0) {
      controller.video.setVolume(100);
      volumeMute = 100;
      isVolumeMute = false;
      emit(SetVolumeVoice());
    }
  }*/

}