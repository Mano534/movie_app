// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../modules/movie.module.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _buildHomeScreenAppBar() {
      return AppBar(
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipPath(
          clipper: AppBarClipper(),
          child: Container(
            decoration: const BoxDecoration(color: Color(0xFF000849)),
            width: double.infinity,
            height: 200,
            child: Center(
              child: Text(
                'Explore',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
    }

    _buildHeader() {
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Feature movies',
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      );
    }

    _buildSpace(){
      return const SizedBox(
              height: 20,
            );
    }

    return Scaffold(
      appBar: _buildHomeScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _buildHeader(),
          _buildSpace(),
           SizedBox(
              height: MediaQuery.of(context).size.height *0.7,
              width: MediaQuery.of(context).size.width ,
              child:  MoiveParallexeEffect(movies: Movie.movies,)),
        ]),
      ),
    );
  }
}
