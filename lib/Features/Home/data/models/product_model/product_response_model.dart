import 'package:hive/hive.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_dimensions.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_meta.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_reviwes.dart';
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

  // New fields 👇
  @HiveField(9)
  final double? discountPercentage;
  @HiveField(10)
  final List<String>? tags;
  @HiveField(11)
  final String? brand;
  @HiveField(12)
  final String? sku;
  @HiveField(13)
  final double? weight;
  @HiveField(14)
  final Dimensions? dimensions;
  @HiveField(15)
  final String? warrantyInformation;
  @HiveField(16)
  final String? shippingInformation;
  @HiveField(17)
  final String? availabilityStatus;
  @HiveField(18)
  final List<Review>? reviews;
  @HiveField(19)
  final String? returnPolicy;
  @HiveField(20)
  final int? minimumOrderQuantity;
  @HiveField(21)
  final Meta? meta;

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
    this.discountPercentage,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: map['category'],
      thumbnail: map['thumbnail'],
      images: List<String>.from(map['images']),
      price: (map['price'] as num?)?.toDouble(),
      rating: (map['rating'] as num?)?.toDouble(),
      stock: map['stock'] ?? 0,
      discountPercentage: (map['discountPercentage'] as num?)?.toDouble(),
      tags: map['tags'] != null ? List<String>.from(map['tags']) : [],
      brand: map['brand'],
      sku: map['sku'],
      weight: (map['weight'] as num?)?.toDouble(),
      dimensions:
          map['dimensions'] != null
              ? Dimensions.fromJson(map['dimensions'])
              : null,
      warrantyInformation: map['warrantyInformation'],
      shippingInformation: map['shippingInformation'],
      availabilityStatus: map['availabilityStatus'],
      reviews:
          map['reviews'] != null
              ? (map['reviews'] as List).map((r) => Review.fromJson(r)).toList()
              : [],
      returnPolicy: map['returnPolicy'],
      minimumOrderQuantity: map['minimumOrderQuantity'],
      meta: map['meta'] != null ? Meta.fromJson(map['meta']) : null,
    );
  }
}
