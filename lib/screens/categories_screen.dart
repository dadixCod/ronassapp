import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/providers/genres.dart';
import 'package:ronasapp/providers/movies.dart';
import 'package:ronasapp/widgets/genre_list.dart';
import 'package:ronasapp/widgets/white_large_text.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProv = Provider.of<Movies>(context, listen: false);

    final genreProv = Provider.of<Genres>(context, listen: false);
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
                FutureBuilder(
                    future: movieProv.getAllMovies(),
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 170,
                        child: ListView.builder(
                          itemCount: genreProv.genres.length,
                          itemBuilder: (context, index) {
                            final genre = genreProv.genres[index];
                            final moviesInGenre =
                                movieProv.getMoviesByGenre(genre.id);
                            if (moviesInGenre.isEmpty) {
                              return const Gap(5);
                            } else {
                              return GenreList(
                                movies: moviesInGenre,
                                genreName: genre.name,
                              );
                            }
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
