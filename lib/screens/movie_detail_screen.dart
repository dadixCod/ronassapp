import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/core/constants/app_colors.dart';
import 'package:ronasapp/models/models.dart';
import 'package:ronasapp/utils/extensions.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const routeName = './movieDetails';

  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late ScrollController _textScrollController;
  @override
  void initState() {
    _textScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _textScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 650,
                    child: Image.asset(
                      movie.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            context.colorScheme.background,
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  movie.name,
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 30,
                                      color: AppColors.orangColor,
                                    ),
                                    Text(
                                      movie.rating.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: AppColors.orangColor,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                movie.publishingYear,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[500],
                                ),
                              ),
                              const Gap(10),
                              if (movie.seasons >= 1)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              const Gap(10),
                              if (movie.seasons >= 1)
                                Text(
                                  movie.seasons == 1 ? "${movie.seasons} season" : "${movie.seasons} seasons",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500],
                                  ),
                                ),
                            ],
                          ),
                          const Gap(15),
                          Row(
                            children: [
                              ...movie.category.map(
                                (category) => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF243C5E).withOpacity(0.8),
                                  ),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            height: 80,
                            child: SingleChildScrollView(
                              controller: _textScrollController,
                              child: Text(
                                movie.description,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  movie.episodesNumber > 1 ? "Episodes" : "Trailer",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Gap(10),
              movie.episodesNumber > 1
                  ? Container(
                      padding: const EdgeInsets.only(left: 15),
                      height: 280,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.episodesNumber,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      margin: const EdgeInsets.only(right: 15),
                                      width: 170,
                                      height: 240,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Image.asset(
                                        movie.path,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                          colors: [
                                            Colors.black87.withOpacity(0.6),
                                            Colors.transparent,
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                      ),
                                    ),
                                    Positioned(
                                      right: 30,
                                      top: 10,
                                      child: Text(
                                        "${movie.minutes} min",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("Episode ${index + 1}"),
                                )
                              ],
                            );
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            width: double.infinity,
                            height: 210,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              movie.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              color: Colors.black45,
                            ),
                          ),
                          Positioned(
                            top: 50,
                            bottom: 50,
                            left: 150,
                            right: 150,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFF243C5E).withOpacity(0.8),
                                  border: Border.all(
                                    color: Colors.white.withAlpha(100),
                                    width: 1.5,
                                  )),
                              child: const Icon(
                                Icons.play_arrow_rounded,
                                size: 45,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              const Gap(100)
            ],
          ),
        ),
        //watch now button
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    "Watch now",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
