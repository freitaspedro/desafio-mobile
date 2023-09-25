import 'package:desafio_mobile/view/commons/widget/progress.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LocationVideo extends StatefulWidget {
  final String uri;

  const LocationVideo({super.key, required this.uri});

  @override
  State<LocationVideo> createState() => _LocationVideoState();
}

class _LocationVideoState extends State<LocationVideo> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  void initPlayer() {
    _videoPlayerController = VideoPlayerController
        .networkUrl(Uri.parse(widget.uri))
     ..initialize().then(
            (_) => setState(
                () => _chewieController = ChewieController(
                  videoPlayerController: _videoPlayerController,
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  autoPlay: true,
                  looping: true,
                  errorBuilder: (context, errorMessage) {
                    return Center(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  },
                )
            )
    );
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized ? Padding(
      padding: const EdgeInsets.all(22.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Chewie(
              controller: _chewieController
          ),
        ),
      ),
    ) : const Progress();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

}
