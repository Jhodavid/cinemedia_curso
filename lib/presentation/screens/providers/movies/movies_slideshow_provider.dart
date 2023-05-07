import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemedia/domain/entities/movie.dart';
import 'package:cinemedia/presentation/screens/providers/movies/movies_providers.dart';



final moviesSlideshowProvider = Provider<List<Movie>>((ref) {

  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if(nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0 ,6);

});