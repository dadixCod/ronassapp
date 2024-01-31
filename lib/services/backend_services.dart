import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ronasapp/core/constants/api_constants.dart';
import 'package:ronasapp/models/models.dart';

class BackendServices {
  static const trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${ApiConstants.apiKey}";
  static Future<List<Movie>> getPopular() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("An error has occurred");
    }
  }
}
