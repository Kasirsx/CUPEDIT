import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayerPage(),
    );
  }
}

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _controller;

  void pickVideo() async {
    final List<AssetEntity>? videos = await AssetPicker.pickAssets(
      context,
      //requestType: RequestType.video,
    );

    if (videos!.isNotEmpty) {
      _controller = VideoPlayerController.file(File(videos[0].videoDuration.toString()));
      await _controller!.initialize();
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player Demo'),
      ),
      body: Center(
        child: _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        )
            : Text('Select a video'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickVideo,
        child: Icon(Icons.folder_open),
      ),
    );
  }
}