import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemedia/infrastructure/repositories/movie_repostirory_impl.dart';



// Es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDataSource() );
});