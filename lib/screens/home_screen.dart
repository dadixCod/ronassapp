import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/providers/providers.dart';
import 'package:ronasapp/screens/screens.dart';
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
    final movieProvider = Provider.of<Movies>(context, listen: false);
    final directorProvider = Provider.of<Directors>(context, listen: false);
    final genreProvider = Provider.of<Genres>(context, listen: false);

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Popular directors",
                        style: context.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    //directors list
                    SizedBox(
                      height: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: directorProvider.directors.length,
                        itemBuilder: (context, index) {
                          final director = directorProvider.directors[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  DirectorDetails.routeName,
                                  arguments: director);
                            },
                            child: DirectorAvatar(
                              director: director,
                            ),
                          );
                        },
                        separatorBuilder: ((context, index) => const Gap(5)),
                      ),
                    ),
                    const WhiteLargeText(text: "Trending"),
                    const Gap(10),
                    //new movies
                    FutureBuilder(
                      future: movieProvider.getTrendingMovies(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          final data = snapshot.data;
                          return MovieCardsList(movies: data!);
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else {
                          return const Text("Error");
                        }
                      },
                    ),
                    const WhiteLargeText(text: "Genres"),
                    const Gap(10),
                    FutureBuilder(
                        future: genreProvider.getGenres(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return SizedBox(
                              height: 110,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final genre = genreProvider.genres[index];
                                  final moviesInGenre =
                                      movieProvider.getMoviesByGenre(genre.id);
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          SpecificCategoryScreen.routeName,
                                          arguments: [
                                            genre.name,
                                            moviesInGenre
                                          ],
                                        );
                                      },
                                      child: GenreCard(genre: genre));
                                },
                                separatorBuilder: (context, index) =>
                                    const Gap(10),
                                itemCount: genreProvider.genres.length,
                              ),
                            );
                          } else {
                            return const Text("Error");
                          }
                        }),

                    const Gap(20),
                    const WhiteLargeText(text: "Coming soon"),
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
