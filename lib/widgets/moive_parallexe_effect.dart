// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:movie_app/modules/movie.module.dart';
import 'package:movie_app/screens/movie.dart';
import 'package:video_player/video_player.dart';

class MoiveParallexeEffect extends StatefulWidget {
  final List<Movie> movies;

  const MoiveParallexeEffect({super.key, required this.movies});

  @override
  State<MoiveParallexeEffect> createState() => _MoiveParallexeEffectState();
}

class _MoiveParallexeEffectState extends State<MoiveParallexeEffect> {
  late PageController pageController;
  int pageCount = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        return VideoCard(
            moviesAsset: widget.movies[index],
            selectedPage: pageCount == index);
      },
      onPageChanged: (value) {
        setState(() {
          pageCount = value;
        });
      },
    );
  }
}

class VideoCard extends StatefulWidget {
  final Movie moviesAsset;
  final bool selectedPage;
  const VideoCard(
      {super.key, required this.moviesAsset, required this.selectedPage});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController? _videoPlayerController;
  final GlobalKey _videoGolobalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.moviesAsset.coverPath);
    _videoPlayerController!
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..setVolume(5000)
      ..initialize().then((value) => setState(() {}))
      ..play();
  }

  @override
  void dispose() {

    _videoPlayerController!.dispose();
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

    _selectedMargin() {
      return widget.selectedPage
          ? const EdgeInsets.symmetric(horizontal: 5, vertical: 0)
          : const EdgeInsets.symmetric(horizontal: 5, vertical: 30);
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: InkWell(
        onTap: () {
          _videoPlayerController!.dispose();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieScreen(movie : widget.moviesAsset,))
            
            );
          },
        child: Container(
          margin: _selectedMargin(),
          decoration: _pageDecoration(),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Flow(
                delegate: ParallaxFlowDelegate(
                    scrollable: Scrollable.of(context),
                    listItemContext: context,
                    backgroundImageKey: _videoGolobalKey),
                children: [
                  AspectRatio(
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(
                        _videoPlayerController!,
                        key: _videoGolobalKey,
                      )),
                ],
              )),
        ),
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      height: constraints.maxHeight,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.topCenter(Offset.zero),
      ancestor: scrollableBox,
    );

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0);

    // Calculate the horizontal alignment of the background
    // based on the scroll percent.
    final horizontalAlignment = Alignment(scrollFraction * 2 - 1, 0);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect = horizontalAlignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(childRect.left, 0)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
