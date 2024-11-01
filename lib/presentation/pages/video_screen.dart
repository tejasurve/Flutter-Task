/*
 * Created on Sat Nov 02 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/content.dart';

class VideoScreen extends StatefulWidget {
  final Content reel;

  const VideoScreen({required this.reel, super.key});

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late CachedVideoPlayerPlusController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(widget.reel.cdnUrl ?? ''),
      invalidateCacheIfOlderThan: const Duration(days: 7),
    );

    _controller.initialize().then((_) {
      setState(() {}); // Trigger a rebuild to display video once initialized
      _controller.play();
    }).catchError((error) {
      print("Error initializing video player: $error");
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  void _seekForward() {
    final newPosition =
        _controller.value.position + const Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  void _seekBackward() {
    final newPosition =
        _controller.value.position - const Duration(seconds: 10);
    _controller.seekTo(newPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CachedVideoPlayerPlus(_controller),
                  )
                : CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.surface,
                  ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _ControlsOverlay(
              controller: _controller,
              onSeekForward: _seekForward,
              onSeekBackward: _seekBackward,
            ),
          ),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatefulWidget {
  final CachedVideoPlayerPlusController controller;
  final VoidCallback onSeekForward;
  final VoidCallback onSeekBackward;

  const _ControlsOverlay({
    required this.controller,
    required this.onSeekForward,
    required this.onSeekBackward,
  });

  @override
  __ControlsOverlayState createState() => __ControlsOverlayState();
}

class __ControlsOverlayState extends State<_ControlsOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              widget.controller.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
              } else {
                widget.controller.play();
              }
              setState(() {}); // Call setState to rebuild the widget
            },
          ),
          IconButton(
            icon: const Icon(Icons.replay_10, color: Colors.white),
            onPressed: widget.onSeekBackward,
          ),
          IconButton(
            icon: const Icon(Icons.forward_10, color: Colors.white),
            onPressed: widget.onSeekForward,
          ),
          Expanded(
            child: VideoProgressIndicator(
              widget.controller,
              allowScrubbing: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
        ],
      ),
    );
  }
}
