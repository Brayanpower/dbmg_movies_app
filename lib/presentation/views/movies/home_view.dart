import 'package:bdmg_movies_app/presentation/providers/movies/movies_providers.dart';
import 'package:bdmg_movies_app/presentation/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppBar(),
              titlePadding: EdgeInsets.zero,
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  MoviesSlideshow(movies: nowPlayingMovies),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En Cines',
                    subtitle: 'A Partir de',
                  ),
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
