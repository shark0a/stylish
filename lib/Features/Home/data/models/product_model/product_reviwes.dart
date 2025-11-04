import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class Review {
  @HiveField(0)
  final double rating;
  @HiveField(1)
  final String comment;
  @HiveField(2)
  final String reviewerName;
  @HiveField(3)
  final String reviewerEmail;
  @HiveField(4)
  final String date;

  Review({
    required this.rating,
    required this.comment,
    required this.reviewerName,
    required this.reviewerEmail,
    required this.date,
  });

  factory Review.fromJson(Map<String, dynamic> map) {
    return Review(
      rating: (map['rating'] as num).toDouble(),
      comment: map['comment'],
      reviewerName: map['reviewerName'],
      reviewerEmail: map['reviewerEmail'],
      date: map['date'],
    );
  }
}
