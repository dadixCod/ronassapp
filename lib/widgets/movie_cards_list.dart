import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/models/movie.dart';
import 'package:ronasapp/widgets/widgets.dart';

import '../screens/screens.dart';

class MovieCardsList extends StatelessWidget {
  final List<Movie> movies;
  const MovieCardsList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        MovieDetailsScreen.routeName,
                        arguments: movie);
                  },
                  child: MovieCard(movie: movie),
                );
              },
              separatorBuilder: (context, index) => const Gap(15),
            ),
    );
  }
}
