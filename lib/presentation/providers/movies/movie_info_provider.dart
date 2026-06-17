import 'package:bdmg_movies_app/domain/domain.dart';
import 'package:bdmg_movies_app/presentation/providers/movies/movies_repository_providers.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
      final MoviesRepository = ref.watch(movieRepositoryProvider);
      return MovieMapNotifier(getMovie: MoviesRepository.getMovieById);
    });

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({required this.getMovie}) : super({});
  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}
