import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/providers/movies.dart';
import 'package:ronasapp/widgets/genre_list.dart';
import 'package:ronasapp/widgets/movie_card.dart';
import 'package:ronasapp/widgets/movie_favorite.dart';
import 'package:ronasapp/widgets/white_large_text.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProv = Provider.of<Movies>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WhiteLargeText(text: "Categories"),
                const Gap(25),
                GenreList(
                  movies: movieProv.movies,
                  genreName: "Action",
                ),
                const Gap(10),
                GenreList(
                  movies: movieProv.movies,
                  genreName: "Biography",
                ),
                const Gap(10),
                GenreList(
                  movies: movieProv.movies,
                  genreName: "Anime",
                ),
                GenreList(
                  movies: movieProv.movies,
                  genreName: "Cartoon",
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
