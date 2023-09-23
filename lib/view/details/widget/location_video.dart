import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LocationVideo extends StatefulWidget {
  final String uri;

  const LocationVideo({super.key, required this.uri});

  @override
  State<LocationVideo> createState() => _LocationVideoState();
}

class _LocationVideoState extends State<LocationVideo> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.uri))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      VideoPlayer(_controller),
                      VideoProgressIndicator(_controller, allowScrubbing: true),
                    ],
                ),
            )
            : const Center(child: CircularProgressIndicator(),),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}
