import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gap/gap.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/providers/providers.dart';
import 'package:ronasapp/screens/director_details_screen.dart';
import 'package:ronasapp/screens/movie_detail_screen.dart';
import 'package:ronasapp/utils/extensions.dart';
import 'package:ronasapp/widgets/movie_cards_list.dart';

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
                        itemCount: directorProvider.directors.length,
                        itemBuilder: (context, index) {
                          final director = directorProvider.directors[index];
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
                    const WhiteLargeText(text: "New Titles"),
                    const Gap(10),
                    //new movies
                    MovieCardsList(movies: movieProvider.movies,),
                    const WhiteLargeText(text: "Genres"),
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
