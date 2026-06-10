import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBKey = dotenv.env['MOVIEDB_KEY'] ?? 'No API Key';
  static String apiUrl = dotenv.env['API_URL'] ?? 'No API Key';
  static String language = dotenv.env['LANGUAGE'] ?? 'No API Key';
}
