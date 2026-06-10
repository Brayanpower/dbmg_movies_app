import 'package:bdmg_movies_app/config/config.dart';
import 'package:bdmg_movies_app/domain/datasources/movies_datasource.dart';
import 'package:bdmg_movies_app/domain/entities/movie.dart';
import 'package:bdmg_movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:dio/dio.dart';

import '../models/moviedb/movieResponse.dart';

class MoviedbDatasourceImpl extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      queryParameters: {
        'api_key': Environment.theMovieDBKey,
        'languaje': Environment.language,
      },
    ),
  );

  @override
  Future<Movie> getMovieById(String id) {
    // TODO: implement getMovieById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    print(response.data);
    final movieDbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDbResponse.results
        .map((movieDb) => MovieMapper.movieDbToEntity(movieDb))
        .toList();
    return [];
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    // TODO: implement getPopular
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getSimilarMovie(String movieId) {
    // TODO: implement getSimilarMovie
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    // TODO: implement getTopRated
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    // TODO: implement getUpcoming
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> getYoutubeVideoById(String movieId) {
    // TODO: implement getYoutubeVideoById
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovie(String query) {
    // TODO: implement searchMovie
    throw UnimplementedError();
  }
}
