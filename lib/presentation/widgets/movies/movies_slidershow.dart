import '../../../domain/domain.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Si la lista viene vacía al inicio, evitamos que Swiper falle devolviendo un loading o espacio vacío
    if (movies.isEmpty) {
      return const SizedBox(
        height: 210,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final filters = movies.take(5).toList();

    return FadeIn(
      child: SizedBox(
        height: 210,
        width: double.infinity,
        child: Swiper(
          scale: 0.9,
          viewportFraction: 0.8,
          autoplay: true,
          pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              activeColor: colors.primary,
              color: Colors.white10,
            ),
          ),
          itemCount: filters
              .length, // <--- CORREGIDO: Ahora coincide perfectamente con los 5 elementos
          itemBuilder: (context, index) => _Slide(movie: filters[index]),
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    //  Mantiene el const principal usando la alternativa eficiente
    var decoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)), // <--- Cambiado aquí
      boxShadow: [
        BoxShadow(offset: Offset(0, 7), blurRadius: 10, color: Colors.black45),
      ],
    );

    // Ajustamos la URL para asegurar que Flutter pueda descargar la imagen de TMDB
    final String fullImageUrl = movie.backdropPath.startsWith('http')
        ? movie.backdropPath
        : 'https://image.tmdb.org/t/p/w500${movie.backdropPath}';

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {},
            child: Image.network(
              fullImageUrl, // <--- URL Corregida
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                // Si la imagen falla por alguna razón, muestra un fondo gris para que no muera la app
                return const ColoredBox(
                  color: Colors.grey,
                  child: Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
