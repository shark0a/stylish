// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      title: fields[1] as String?,
      description: fields[2] as String?,
      category: fields[3] as String?,
      thumbnail: fields[4] as String?,
      images: (fields[5] as List).cast<dynamic>(),
      price: fields[6] as double?,
      rating: fields[7] as double?,
      stock: fields[8] as int?,
      discountPercentage: fields[9] as double?,
      tags: (fields[10] as List?)?.cast<String>(),
      brand: fields[11] as String?,
      sku: fields[12] as String?,
      weight: fields[13] as double?,
      dimensions: fields[14] as Dimensions?,
      warrantyInformation: fields[15] as String?,
      shippingInformation: fields[16] as String?,
      availabilityStatus: fields[17] as String?,
      reviews: (fields[18] as List?)?.cast<Review>(),
      returnPolicy: fields[19] as String?,
      minimumOrderQuantity: fields[20] as int?,
      meta: fields[21] as Meta?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(5)
      ..write(obj.images)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.stock)
      ..writeByte(9)
      ..write(obj.discountPercentage)
      ..writeByte(10)
      ..write(obj.tags)
      ..writeByte(11)
      ..write(obj.brand)
      ..writeByte(12)
      ..write(obj.sku)
      ..writeByte(13)
      ..write(obj.weight)
      ..writeByte(14)
      ..write(obj.dimensions)
      ..writeByte(15)
      ..write(obj.warrantyInformation)
      ..writeByte(16)
      ..write(obj.shippingInformation)
      ..writeByte(17)
      ..write(obj.availabilityStatus)
      ..writeByte(18)
      ..write(obj.reviews)
      ..writeByte(19)
      ..write(obj.returnPolicy)
      ..writeByte(20)
      ..write(obj.minimumOrderQuantity)
      ..writeByte(21)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
