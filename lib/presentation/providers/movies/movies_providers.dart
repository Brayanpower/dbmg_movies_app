import 'package:bdmg_movies_app/domain/entities/movie.dart';
import 'package:bdmg_movies_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [
      ...state,
      ...movies,
    ]; // Aquí actualizas el estado con las nuevas películas

    // Cambiado de seconds: 300 a milliseconds: 300
    await Future.delayed(const Duration(milliseconds: 300));

    isLoading = false;
  }
}
