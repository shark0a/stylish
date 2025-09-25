class ProductModel {
  final int id;
  final String? title;
  final String? description;
  final String? category;
  final String? thumbnail;
  final List<dynamic> images;
  final double? price;
  final double? rating;
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
