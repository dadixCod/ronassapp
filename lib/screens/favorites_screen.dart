import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ronasapp/providers/movies.dart';
import 'package:ronasapp/screens/movie_detail_screen.dart';
import 'package:ronasapp/widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProv = Provider.of<Movies>(context, listen: true);
    final favoritesList = movieProv.favoriteMovies;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Favorites",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      favoritesList.length.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                favoritesList.isEmpty
                    ? SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          children: [
                            const Gap(30),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              child: Image.asset(
                                'assets/icons/empty-box.png',
                                width: 100,
                                height: 100,
                              ),
                            ),
                            const WhiteLargeText(text: "No favorites yet")
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 350,
                        child: CardSwiper(
                          cardsCount: favoritesList.length,
                          duration: const Duration(milliseconds: 100),
                          padding: EdgeInsets.zero,
                          backCardOffset: const Offset(90, -10),
                          numberOfCardsDisplayed: favoritesList.length <= 3
                              ? favoritesList.length
                              : 3,
                          cardBuilder: ((
                            context,
                            index,
                            horizontalOffsetPercentage,
                            verticalOffsetPercentage,
                          ) =>
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    MovieDetailsScreen.routeName,
                                    arguments: favoritesList[index],
                                  );
                                },
                                child: MovieFavorite(
                                  movie: favoritesList[index],
                                ),
                              )),
                        ),
                      ),
                const Gap(20),
                const WhiteLargeText(text: "Recommended"),
                const Gap(10),
                MovieCardsList(
                  movies: movieProv.popularMovies,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
