import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:bdmg_movies_app/domain/domain.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class MoviesSlidershow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlidershow(this.movies, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return movies.isNotEmpty
        ? SizedBox(
            height: 210,
            width: double.infinity,
            child: Swiper(
              itemCount: movies.length,
              itemBuilder: (context, index) => Placeholder(),
            ),
          )
        : SizedBox();
  }
}
