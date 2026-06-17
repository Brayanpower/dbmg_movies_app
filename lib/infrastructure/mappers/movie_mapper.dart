import 'package:bdmg_movies_app/domain/domain.dart';
import 'package:bdmg_movies_app/infrastructure/models/moviedb/movieResponse.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieDb movieDb) => Movie(
    adult: movieDb.adult,

    // 1. CORREGIDO: cambiado 'tbmb' por 'tmdb'
    backdropPath: (movieDb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
        : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png', // O una URL con imagen por defecto

    genreIds: movieDb.genreIds.map(((e) => e.toString())).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,

    // 2. CORREGIDO: cambiado 'tbmb' por 'tmdb' y cambiado 'backdropPath' por 'posterPath'
    posterPath: (movieDb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
        : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',

    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );

  static Movie movieDetailToEntity(MovieDb movieDb) => Movie(
    adult: movieDb.adult,

    // 1. CORREGIDO: cambiado 'tbmb' por 'tmdb'
    backdropPath: (movieDb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
        : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png', // O una URL con imagen por defecto

    genreIds: movieDb.genreIds.map(((e) => e.toString())).toList(),
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,

    // 2. CORREGIDO: cambiado 'tbmb' por 'tmdb' y cambiado 'backdropPath' por 'posterPath'
    posterPath: (movieDb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
        : 'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png',

    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );
}
