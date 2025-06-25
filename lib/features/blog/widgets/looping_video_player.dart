import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:healofy_assignment/utils/app_extensions.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:video_player/video_player.dart';

class LoopingVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String? thumbnail;

  const LoopingVideoPlayer({super.key, required this.videoUrl, this.thumbnail});

  @override
  State<LoopingVideoPlayer> createState() => _LoopingVideoPlayerState();
}

class _LoopingVideoPlayerState extends State<LoopingVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller.play(); // TODO: uncomment to auto-play the video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)).asLoading(
      isLoading: !_controller.value.isInitialized,
      child: widget.thumbnail != null
          ? CachedNetworkImage(
              imageUrl: widget.thumbnail!,
              placeholder: (context, url) => Shimmer(child: Container()),
            )
          : null,
    );
  }
}
