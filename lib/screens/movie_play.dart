import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/movie.module.dart';
import 'package:video_player/video_player.dart';

class MoviePlay extends StatefulWidget {
  const MoviePlay({super.key,required this.movie});
final Movie movie ;
  @override
  State<MoviePlay> createState() => _MoviePlayState();
}

class _MoviePlayState extends State<MoviePlay> {
  late VideoPlayerController? videoController ;
  late ChewieController? chewieController;
  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.asset(widget.movie.videoPath);
    videoController!..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..setVolume(1000)
      ..initialize().then((value) => setState(() {}));
    chewieController = ChewieController(videoPlayerController: videoController!, aspectRatio: 16/9);
  }
  @override
  void dispose() {
    chewieController!.dispose();
    videoController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: Chewie(controller: chewieController!)),
    );
  }
}