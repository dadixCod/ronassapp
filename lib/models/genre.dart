// ignore_for_file: public_member_api_docs, sort_constructors_first
class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] ?? 000,
      name: json['name'] ?? 'No genre',
    );
  }
}
