import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/widgets/widgets.dart';

import 'package:ronasapp/models/models.dart';

class GenreList extends StatelessWidget {
  final String genreName;
  final List<Movie> movies;
  const GenreList({super.key, required this.movies, required this.genreName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              genreName,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Row(
                children: [
                  Text(
                    "view all",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Gap(5),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: Colors.grey,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 230,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieFavorite(
                movie: movie,
                height: 220,
                width: 150,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        ),
      ],
    );
  }
}
