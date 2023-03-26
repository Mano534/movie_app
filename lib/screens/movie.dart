// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/modules/movie.module.dart';
import 'package:movie_app/screens/movie_play.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;

  const MovieScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildBackground({required String imageCover}) {
      return [
        Container(
          color: const Color(0xFF000849),
          height: double.infinity,
        ),
        Image.asset(
          imageCover,
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color(0xfff000849).withOpacity(0.3),
                    const Color(0xFFF000849)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.4, 0.7])),
        )
      ];
    }

    Widget _buildMovieInfo() {
      return Positioned(
        bottom: 150,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${movie.year.toString()} | ${movie.category} | ${movie.duration.inHours}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.white, fontSize: 14),
              ),
              RatingBar.builder(
                initialRating: 3.5,
                allowHalfRating: true,
                minRating: 1,
                unratedColor: Colors.white,
                ignoreGestures: true,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.description,
                maxLines: 8,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Colors.white, height: 1.75),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        ..._buildBackground(imageCover: movie.imagePAth),
        _buildMovieInfo(),
        Positioned(
            bottom: 50,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        backgroundColor:const  Color(0xFFFF7272),
                        padding: const EdgeInsets.all(15),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * .425, 50)),
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Add ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'To watchList',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                            ),
                          ]),
                    )),
                   const  SizedBox(width: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * .425, 50)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return MoviePlay(movie : movie,);
                      },));
                    },
                     child: RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Start ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Watching',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                            ),
                          ]),))
              ],
            ))
      ]),
    );
  }
}
