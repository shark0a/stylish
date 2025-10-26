import 'package:hive/hive.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(1)
  final String id;
  @HiveField(2)
  final ProductModel item;

  CartModel({required this.id, required this.item});
}
