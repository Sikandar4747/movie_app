import 'package:flutter/material.dart';
import 'package:tentwenty/presentation/views/details_screen.dart';
import 'package:video_player/video_player.dart';

import '../../constants/colors_constants.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, this.url}) : super(key: key);
  final String? url;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url ?? 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.addListener(_completionCheck);
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 51,
              ),
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: AppColors.appBarSubTitleTextColor,
                borderRadius: 15,
                width: 230,
                btnTxt: 'Done',
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller.removeListener(_completionCheck);
  }

  void _completionCheck() {
    if (_controller.value.position == _controller.value.duration) {
      Navigator.of(context).pop();
    }
  }
}
