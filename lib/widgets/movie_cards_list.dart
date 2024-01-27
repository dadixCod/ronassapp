import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/models/movie.dart';
import 'package:ronasapp/providers/movies.dart';
import 'package:ronasapp/widgets/widgets.dart';

import '../screens/screens.dart';

class MovieCardsList extends StatelessWidget {
  final List<Movie> movies;
  const MovieCardsList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 330,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(MovieDetailsScreen.routeName, arguments: movie);
                },
                child: MovieCard(movie: movie));
          },
          separatorBuilder: (context, index) => const Gap(15),
        ),
      
    );
  }
}
