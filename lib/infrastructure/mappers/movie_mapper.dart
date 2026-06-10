import 'package:bdmg_movies_app/domain/domain.dart';
import 'package:bdmg_movies_app/infrastructure/models/moviedb/movieResponse.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieDb movieDb) => Movie(
    adult: movieDb.adult,
    backdropPath: (movieDb.backdropPath != '')
        ? 'https://image.tbmb.org/t/p/w500${movieDb.backdropPath}'
        : '',
    genreIds: movieDb.genreIds,
    id: movieDb.id,
    originalLanguage: movieDb.originalLanguage,
    originalTitle: movieDb.originalTitle,
    overview: movieDb.overview,
    popularity: movieDb.popularity,
    posterPath: (movieDb.posterPath != '')
        ? 'https://image.tbmb.org/t/p/w500${movieDb.backdropPath}'
        : '',
    releaseDate: movieDb.releaseDate,
    title: movieDb.title,
    video: movieDb.video,
    voteAverage: movieDb.voteAverage,
    voteCount: movieDb.voteCount,
  );
}
