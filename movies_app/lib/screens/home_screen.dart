import 'package:flutter/material.dart';
import 'package:movies_app/search/search_delegate.dart';
import 'package:provider/provider.dart';

import 'package:movies_app/providers/providers.dart';
import 'package:movies_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas Actuales'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Principal Cards
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              // On Screen Slider
              MovieSlider(
                onNextPage: () {},
                title: 'Movies on Screen',
                movies: moviesProvider.onDisplayMovies,
              ),
              // Popular Slider
              MovieSlider(
                onNextPage: () => moviesProvider.getPopularMovies(),
                title: 'Popular',
                movies: moviesProvider.popularMovies,
              ),
            ],
          ),
        ));
  }
}
