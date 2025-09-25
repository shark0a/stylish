import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/star_rating.dart';
import 'package:stylish/core/utils/app_styles.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.products});
  final ProductModel products;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffFDFDFD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      clipBehavior: Clip.antiAlias,

      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              products.images.isNotEmpty
                  ? products.images.first
                  : products.thumbnail,
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: AppStyles.primaryBackgroungColor,
                  height: 90,
                  width: 90,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppStyles.primaryBackgroungColor,
                      color: AppStyles.changeSeconderyTextgColor,
                    ),
                  ),
                );
              },
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title ?? 'Product Title',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  products.description ??
                      'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.60,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  products.price.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    StarRating(rating: products.rating ?? 0, size: 24),
                    const SizedBox(width: 4),
                    Text(
                      "${products.stock ?? 523456}  ",
                      style: TextStyle(
                        color: const Color(0xFFA4A9B3),
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
