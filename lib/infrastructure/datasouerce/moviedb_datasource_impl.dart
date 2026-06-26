import 'package:bdmg_movies_app/config/config.dart';
import 'package:bdmg_movies_app/domain/datasources/movies_datasource.dart';
import 'package:bdmg_movies_app/domain/entities/movie.dart';
import 'package:bdmg_movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);
  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    final response = await dio.get(
      '/movie/$movieId/credits'
    );

    final credits = MovieDbCredits.fromJson(response.data);

    List<Actor> actors = credits.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();

    return actors;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    return datasource.getSimilarMovie(movieId);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getYoutubeVideoById(String movieId) {
    return datasource.getYoutubeVideoById(movieId);
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    return datasource.searchMovie(query);
  }
}