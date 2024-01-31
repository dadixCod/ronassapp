import 'package:flutter/material.dart';
import 'package:ronasapp/models/movie.dart';
import 'package:ronasapp/services/backend_services.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  Future<List<Movie>> getTrendingMovies() async {
    if (_movies.isEmpty) {
      final trendList = await BackendServices.getPopular();
      _movies = trendList;
      notifyListeners();
      return _movies;
    } else {
      return _movies;
    }
  }

  List<Movie> favoriteMovies = [];

  void makeFavorite(Movie movie) {
    movie.isFavorite = !movie.isFavorite;
    favoriteMovies = _movies.where((movie) => movie.isFavorite).toList();
    notifyListeners();
  }
}
