// ignore_for_file: non_constant_identifier_names

import 'package:cinemedia/domain/entities/movie.dart';
import 'package:cinemedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {

  static Movie MovieDBToEntity( MovieFromMovieDB moviedb ) => Movie(
    adult: moviedb.adult, 
    backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
      : '/assets/not-found.png',
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(), 
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount
  );

}