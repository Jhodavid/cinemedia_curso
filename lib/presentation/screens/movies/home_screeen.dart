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
  }

  @override
  Widget build(BuildContext context) {

    final moviesSlideshow = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

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
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
                    },
                  ),
            
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Este mes',
                    // subTitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
                    },
                  ),
            
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Populares',
                    // subTitle: 'Lunes 20',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
                    },
                  ),
            
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'Mejor calificadas',
                    subTitle: 'Todos los tiempos',
                    loadNextPage: () {
                      ref.read(nowPlayingMoviesProvider.notifier).lowNextPage();
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