// ignore_for_file: public_member_api_docs, sort_constructors_first
class Genre {
  final String name;
  final String fontFamily;
  Genre({
    required this.name,
    required this.fontFamily,
  });
}

List<Genre> genres = [
  Genre(name: 'Biography', fontFamily: 'Birds of Paradise'),
  Genre(name: 'ANIME', fontFamily: 'gangOfThree'),
  Genre(name: 'Action', fontFamily: 'VampireWars'),
  Genre(name: 'Cartoon', fontFamily: 'ToonyLine'),
];
