import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/screens/director_details_screen.dart';
import 'package:ronasapp/screens/movie_detail_screen.dart';
import 'package:ronasapp/utils/extensions.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Popular directors",
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                        ),
                      ),
                    ),
                    //directors list
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: directors.length,
                        itemBuilder: (context, index) {
                          final director = directors[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(DirectorDetails.routeName, arguments: director);
                            },
                            child: DirectorAvatar(
                              director: director,
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) => const Gap(5)),
                      ),
                    ),
                    const Text(
                      "New titles",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(10),
                    //new movies
                    SizedBox(
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
                    ),
                    const Text(
                      "Genres",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(10),
                    SizedBox(
                      height: 110,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final genre = genres[index];
                          return GenreCard(genre: genre);
                        },
                        separatorBuilder: (context, index) => const Gap(10),
                        itemCount: genres.length,
                      ),
                    ),
                    const Gap(20),
                    const Text(
                      "Coming soon",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Gap(10),
                    const ComingSoonMovieCard(),
                    // const Gap(70),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
