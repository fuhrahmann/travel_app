class User {
  final String name;
  final String email;
  final String? password;  // Made optional - should not be stored in UI model
  final String avatarUrl;
  final int tripsCompleted;
  final int reviewsWritten;
  final String memberSince;

  User({
    required this.name,
    required this.email,
    this.password,  // Optional parameter
    required this.avatarUrl,
    required this.tripsCompleted,
    required this.reviewsWritten,
    required this.memberSince,
  });
}
