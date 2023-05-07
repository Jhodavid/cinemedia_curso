import 'package:cinemedia/config/constants/environment.dart';
import 'package:cinemedia/domain/datasources/movies_datasource.dart';
import 'package:cinemedia/domain/entities/movie.dart';
import 'package:cinemedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';



class MoviedbDataSource extends MoviesDataSource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMoviedbKey,
      'language': 'es-COL'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
      .where((moviedb) => moviedb.posterPath != 'no-poster')
      .map(
        (moviedb) => MovieMapper.MovieDBToEntity(moviedb)
      ).toList();

    return movies;
  }

}