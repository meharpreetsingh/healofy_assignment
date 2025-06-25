import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:video_player/video_player.dart';

class HVideoPlayer extends StatefulWidget {
  const HVideoPlayer({super.key, required this.videoUrl, this.thumbnail, this.height, this.width, this.autoPlay = true});

  final String videoUrl;
  final String? thumbnail;
  final double? height;
  final double? width;
  final bool autoPlay;

  @override
  State<HVideoPlayer> createState() => _HVideoPlayerState();
}

class _HVideoPlayerState extends State<HVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(widget.videoUrl),
            viewType: VideoViewType.platformView,
            videoPlayerOptions: VideoPlayerOptions(allowBackgroundPlayback: true, mixWithOthers: true),
          )
          ..setLooping(true)
          ..initialize().then((_) {
            setState(() {});
            if (widget.autoPlay) _controller.play();
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if ((_controller.value.isBuffering || _controller.value.hasError || !_controller.value.isInitialized) &&
        widget.thumbnail != null) {
      return CachedNetworkImage(
        imageUrl: widget.thumbnail!,
        height: widget.height,
        width: widget.width,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer(child: Container(color: Colors.grey.shade300)),
      );
    }
    return GestureDetector(
      onTap: () {
        if (!_controller.value.isPlaying) {
          _controller.play();
        } else {
          _controller.pause();
        }
      },
      child: SizedBox(
        height: widget.height ?? 250,
        width: widget.width ?? double.infinity,
        child: ColoredBox(
          color: Colors.transparent,
          child: AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller)),
        ),
      ),
    );
  }
}
