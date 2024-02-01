import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ronasapp/core/constants/api_constants.dart';
import 'package:ronasapp/models/models.dart';

class BackendServices {
  static const trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${ApiConstants.apiKey}";
  static const genreUrl =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=${ApiConstants.apiKey}";
  static const allMoviesUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apiKey}";
  static const popularMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${ApiConstants.apiKey}";
  static Future<List<Movie>> getTrending() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("An error has occurred");
    }
  }

  static Future<List<Movie>> getAllMovies() async {
    final response = await http.get(Uri.parse(allMoviesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("An error has occurred");
    }
  }

  static Future<List<Movie>> getPopular() async {
    final response = await http.get(Uri.parse(popularMoviesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("An error has occurred");
    }
  }

  static Future<List<Genre>> getGenres() async {
    final response = await http.get(Uri.parse(genreUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['genres'] as List;
      return decodedData.map((genre) => Genre.fromJson(genre)).toList();
    } else {
      throw Exception("An error has occurred");
    }
  }
}
