import 'package:flutter/material.dart';
import 'package:ronasapp/models/movie.dart';
import 'package:ronasapp/services/backend_services.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];
  List<Movie> get movies {
    if (_movies.isEmpty) {
      getAllMovies();
    }
    return _movies;
  }

  List<Movie> _trendingMovies = [];
  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> _popularMovies = [];
  List<Movie> get popularMovies {
    if (_popularMovies.isEmpty) {
      getPopular();
    }
    return _popularMovies;
  }

  List<Movie> getMoviesByGenre(Object? element) {
    final list =
        movies.where((movie) => movie.genres.contains(element)).toList();
    return list;
  }

  Future<List<Movie>> getTrendingMovies() async {
    _trendingMovies = await BackendServices.getTrending();
    notifyListeners();
    return _trendingMovies;
  }

  Future<List<Movie>> getAllMovies() async {
    _movies = await BackendServices.getTrending();
    notifyListeners();
    return _movies;
  }

  Future<List<Movie>> getPopular() async {
    _popularMovies = await BackendServices.getPopular();
    notifyListeners();
    return _popularMovies;
  }

  List<Movie> favoriteMovies = [];

  void makeFavorite(Movie movie) {
    movie.isFavorite = !movie.isFavorite;

    if (movie.isFavorite) {
      if (favoriteMovies.contains(movie)) {
        return;
      }
      favoriteMovies.add(movie);
    } else {
      favoriteMovies.remove(movie);
    }
    notifyListeners();
  }
}
