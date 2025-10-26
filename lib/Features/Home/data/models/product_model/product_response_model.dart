import 'package:hive/hive.dart';
part 'product_response_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final String? thumbnail;
  @HiveField(5)
  final List<dynamic> images;
  @HiveField(6)
  final double? price;
  @HiveField(7)
  final double? rating;
  @HiveField(8)
  final int? stock;

  ProductModel({
    required this.id,
    this.title,
    this.description,
    this.category,
    this.thumbnail,
    required this.images,
    required this.price,
    this.rating,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: (map['images']),
      price: (map['price'] as num?)?.toDouble(),
      rating: (map['rating'] as num?)?.toDouble(),
      stock: map['stock'] as int? ?? 0,
    );
  }
}
