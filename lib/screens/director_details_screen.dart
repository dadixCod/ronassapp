import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ronasapp/utils/extensions.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class DirectorDetails extends StatelessWidget {
  static const routeName = 'directorDetails';

  const DirectorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final director = ModalRoute.of(context)?.settings.arguments as Director;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Image.asset(
                    director.path,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    director.name,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const BackBtnCircle(),
              ],
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  const Text(
                    "Rating : ",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  for (int i = 1; i <= 5; i++)
                    i <= director.ratingStars!
                        ? const Icon(
                            Icons.star,
                            color: Colors.amber,
                          )
                        : const Icon(
                            Icons.star_border,
                          ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
