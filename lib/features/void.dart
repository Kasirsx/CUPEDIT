import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:flutter/material.dart';



class RemoveAudioScreen extends StatefulWidget {
  const RemoveAudioScreen({super.key});

  @override
  _RemoveAudioScreenState createState() => _RemoveAudioScreenState();
}

class _RemoveAudioScreenState extends State<RemoveAudioScreen> {
  final FFmpegKit _flutterFFmpeg = FFmpegKit();

  final String _inputVideoPath = '/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/WhatsApp Video/VID-20240219-WA0024.mp4';
  final String _outputVideoPath = '/storage/emulated/0/Android/media/hany.mp4';

  void _removeAudioFromVideo() async {
    final String command = '-i $_inputVideoPath -c copy -an $_outputVideoPath';

    var result = await FFmpegKit.execute(command);
    if (result == 0) {
      print('Audio removed successfully.');
    } else {
      print('Error removing audio from video. Exit code: $result');
    }
  }

  @override
  void dispose() {
    FFmpegKit.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove Video Audio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: _removeAudioFromVideo,
              child: const Text('Remove Audio'),
            ),
          ],
        ),
      ),
    );
  }
}