import 'package:flutter/material.dart';

import 'package:webviewtube/webviewtube.dart';

class YouTubeWidget extends StatefulWidget {
  final String videoId;
  YouTubeWidget({super.key, required this.videoId});

  @override
  State<YouTubeWidget> createState() => _YouTubeWidgetState();
}

class _YouTubeWidgetState extends State<YouTubeWidget> {
  @override
  void initState() {
    // _playerController = YoutubePlayerController(
    //     initialVideoId: widget.videoId,
    //     flags: YoutubePlayerFlags(
    //         autoPlay: false, showLiveFullscreenButton: false));

    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return YoutubePlayer(
  //     controller: _playerController,
  //     showVideoProgressIndicator: true,
  //     progressColors: ProgressBarColors(
  //       playedColor:  ThemeManagerPlus.of<AppTheme>(context).currentTheme.button_color,
  //       handleColor:  ThemeManagerPlus.of<AppTheme>(context).currentTheme.button_color,
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return WebviewtubeVideoPlayer(videoId: widget.videoId);
  }
}
