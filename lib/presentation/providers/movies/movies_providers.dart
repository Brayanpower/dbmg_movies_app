import 'package:bdmg_movies_app/domain/entities/movie.dart';
import 'package:bdmg_movies_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

final nowPlayingMoviesProviders =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      final fechtMoreMovie = ref.watch(movieRepositoryProvider).getNowPlaying;
      return MoviesNotifier(fechtMoreMovie: fechtMoreMovie);
    });

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false;
  MovieCallBack fechtMoreMovie;

  MoviesNotifier({required this.fechtMoreMovie}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    final List<Movie> movies = await fechtMoreMovie(page: currentPage);
    state = [...state, ...movies];
    await Future.delayed(const Duration(microseconds: 300));
    isLoading = false;
  }
}
