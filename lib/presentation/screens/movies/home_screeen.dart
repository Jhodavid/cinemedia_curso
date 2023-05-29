import 'package:cinemedia/config/location/cinemedia_lozalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemedia/presentation/widgets/widgets.dart';
import 'package:cinemedia/presentation/screens/providers/providers.dart';



class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: const CustomButtomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
    ref.read(popularMoviesProvider.notifier).lowNextPage();
    ref.read(topRatedMoviesProvider.notifier).lowNextPage();
    ref.read(upcomingMoviesProvider.notifier).lowNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final moviesSlideshow = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );

    final locatedStrings = CinemediaLocalizations.of(context).home;

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            centerTitle: true,
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [

                  MoviesSlideshow(movies: moviesSlideshow),
            
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: locatedStrings.inTheatersTitle,
                    subTitle: locatedStrings.inTheatersSubtitle,
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
                    },
                  ),
            
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: locatedStrings.thisMonTitle,
                    // subTitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
                    },
                  ),
            
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: locatedStrings.polularTitle,
                    // subTitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(popularMoviesProvider.notifier).lowNextPage();
                    },
                  ),

                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: locatedStrings.upcomingTitle,
                    subTitle: locatedStrings.bestSubtitle,
                    loadNextPage: () {
                      ref.read(upcomingMoviesProvider.notifier).lowNextPage();
                    },
                  ),
            
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: locatedStrings.bestTitle,
                    subTitle: locatedStrings.bestSubtitle,
                    loadNextPage: () {
                      ref.read(topRatedMoviesProvider.notifier).lowNextPage();
                    },
                  ),

                  const SizedBox(height: 20)
                ],
              );
            },
            childCount: 1
          )
        )
      ] 
    );
  }
}