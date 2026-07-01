import 'package:bdmg_movies_app/infrastructure/infrastructure.dart';
import 'package:bdmg_movies_app/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasourceImpl());
});
