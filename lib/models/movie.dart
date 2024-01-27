// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class Movie {
  final String name;
  final List<String> category;
  final int minutes;
  final double rating;
  final String path;
  final String publishingYear;
  final String description;
  final int episodesNumber;
  final int seasons;

  const Movie({
    required this.name,
    required this.category,
    required this.minutes,
    required this.rating,
    required this.path,
    required this.publishingYear,
    required this.description,
    required this.episodesNumber,
    required this.seasons,
  });
}



List<Movie> movies = [
  const Movie(
    name: 'Fast & Furious 6',
    category: ['Action'],
    minutes: 122,
    rating: 8.7,
    path: 'assets/movies/ff6cover.jpg',
    publishingYear: '2013',
    description:
        "Fast & Furious 6 (titled on-screen as Furious 6, and in Japan as Wild Speed: Euro Mission)[8][9] is a 2013 action film directed by Justin Lin and written by Chris Morgan. It is the sequel to Fast Five (2011) and the sixth installment in the Fast & Furious franchise. The film stars Vin Diesel as Dominic Toretto and Paul Walker as Brian O'Conner, alongside Dwayne Johnson, Michelle Rodriguez, Jordana Brewster, Tyrese Gibson, Chris Ludacris Bridges, Sung Kang, Luke Evans, Gina Carano, and John Ortiz. In the film, Toretto, O'Conner, and their team are offered pardons for their crimes in exchange for helping DSS agent Luke Hobbs (Johnson) apprehend a mercenary organization led by former British SAS major Owen Shaw (Evans), one member of which is Toretto's former lover Letty Ortiz (Rodriguez).",
    episodesNumber: 1,
    seasons: 0,
  ),
  const Movie(
    name: 'Game Of Thrones',
    category: ['Drama'],
    minutes: 54,
    rating: 9.0,
    path: 'assets/movies/Game_of_Thrones_Season_1.jpg',
    publishingYear: '2011',
    description:
        "Game of Thrones is an American fantasy drama television series created by David Benioff and D. B. Weiss for HBO. It is an adaptation of A Song of Ice and Fire, a series of fantasy novels by George R. R. Martin, the first of which is A Game of Thrones. The show premiered on HBO in the United States on April 17, 2011, and concluded on May 19, 2019, with 73 episodes broadcast over eight seasons.",
    episodesNumber: 10,
    seasons: 10,
  ),
  const Movie(
    name: 'Money Heist',
    category: ['Drama'],
    minutes: 49,
    rating: 8.5,
    path: 'assets/movies/money_heist.png',
    publishingYear: '2019',
    description:
        "Money Heist (Spanish: La casa de papel, [la ˈkasa ðe paˈpel], lit. 'The House of Paper') is a Spanish heist crime drama television series created by Álex Pina. The series traces two long-prepared heists led by the Professor (Álvaro Morte), one on the Royal Mint of Spain, and one on the Bank of Spain, told from the perspective of one of the robbers, Tokyo (Úrsula Corberó). The story is told in a real-time-like fashion and relies on an unreliable narrator, flashbacks, time-jumps and hidden character motivations for complexity",
    episodesNumber: 15,
    seasons: 4,
  ),
  const Movie(
    name: 'Spider Man: Across the Spider Verse',
    category: ['Comics'],
    minutes: 140,
    rating: 7.8,
    path: 'assets/movies/Spider-Man-_Across_the_Spider-Verse_poster.jpg',
    publishingYear: '2023',
    description:
        "Spider-Man: Across the Spider-Verse is a 2023 American animated superhero film featuring the Marvel Comics character Miles Morales / Spider-Man, produced by Columbia Pictures and Sony Pictures Animation in association with Marvel Entertainment, and distributed by Sony Pictures Releasing. It is the sequel to Spider-Man: Into the Spider-Verse (2018), set in a shared multiverse of alternate universes called the Spider-Verse",
    episodesNumber: 1,
    seasons: 0,
  ),
  const Movie(
    name: 'Squid Game',
    category: ['Survival', 'Drama'],
    minutes: 52,
    rating: 8.4,
    path: 'assets/movies/Squid_Game.jpg',
    publishingYear: '2021',
    description:
        "Squid Game (Korean: 오징어 게임) is a South Korean television series created by Hwang Dong-hyuk for Netflix. Its cast includes Lee Jung-jae, Park Hae-soo, Wi Ha-joon, HoYeon Jung, O Yeong-su, Heo Sung-tae, Anupam Tripathi and Kim Joo-ryoung.",
    episodesNumber: 14,
    seasons: 1,
  ),
];
