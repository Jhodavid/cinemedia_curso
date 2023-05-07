
import 'package:cinemedia/domain/datasources/movies_datasource.dart';
import 'package:cinemedia/domain/entities/movie.dart';
import 'package:cinemedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  
  final MoviesDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return dataSource.getNowPlaying(page: page);
  }

}