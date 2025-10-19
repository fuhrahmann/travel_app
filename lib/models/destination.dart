class Destination {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviews;
  final double price;
  final List<String> activities;
  final String duration;
  bool isFavorite;

  Destination({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.activities,
    required this.duration,
    this.isFavorite = false,
  });
}
