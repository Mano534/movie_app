// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:movie_app/modules/movie.module.dart';
import 'package:video_player/video_player.dart';

class MoiveParallexeEffect extends StatefulWidget {
  final List<Movie> movies;

  const MoiveParallexeEffect({super.key, required this.movies});

  @override
  State<MoiveParallexeEffect> createState() => _MoiveParallexeEffectState();
}

class _MoiveParallexeEffectState extends State<MoiveParallexeEffect> {
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return VideoCard(moviesAsset: widget.movies[index].coverPath);
      },
    );
  }
}

class VideoCard extends StatefulWidget {
  final String moviesAsset;

  const VideoCard({super.key, required this.moviesAsset});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.moviesAsset);
    _videoPlayerController
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..setVolume(1000)
      ..initialize().then((value) => setState(() {}))
      ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageDecoration() {
      return BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 6),
        )
      ], borderRadius: BorderRadius.circular(16));
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _pageDecoration(),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))),
    );
  }
}
