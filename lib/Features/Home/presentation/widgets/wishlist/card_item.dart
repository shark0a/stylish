import 'package:cached_network_image/cached_network_image.dart';
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
            child: Hero(
              tag: products.id,
              child: CachedNetworkImage(
                imageUrl:
                    products.images.isNotEmpty
                        ? products.images.first
                        : products.thumbnail,
                fit: BoxFit.cover,

                placeholder:
                    (context, url) => Container(
                      color: AppStyles.primaryBackgroungColor,
                      height: 120,
                      width: double.infinity,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppStyles.changeSeconderyTextgColor,
                          backgroundColor: AppStyles.primaryBackgroungColor,
                        ),
                      ),
                    ),

                errorWidget:
                    (context, url, error) => const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
              ),
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
