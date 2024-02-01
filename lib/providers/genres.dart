import 'package:flutter/cupertino.dart';
import 'package:ronasapp/services/backend_services.dart';

import '../models/models.dart';

class Genres with ChangeNotifier {
  List<Genre> _genres = [];
  List<Genre> get genres => _genres;
  List<String> genreList = [];

  Future<List<Genre>> getGenres() async {
    _genres = await BackendServices.getGenres();

    notifyListeners();
    return _genres;
  }

  List<String> getMovieGenres(List<dynamic> genreIds) {
    genreList.clear();
    for (var id in genreIds) {
      final list = _genres.where((genre) => genre.id == id).toList();
      for (var genre in list) {
        genreList.add(genre.name);
      }
    }
    return genreList;
  }
}
