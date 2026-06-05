import 'package:bdmg_movies_app/presentation/widgets/movies/movies_slidershow.dart';
import 'package:bdmg_movies_app/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:uya_movies_app/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  MoviesSlideshow(movies: []),
                  Text('data'),
                ],
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
