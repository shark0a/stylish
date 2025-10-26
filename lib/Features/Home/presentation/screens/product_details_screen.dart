import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/star_rating.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/display_product_image.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/indicator_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/size_list_view.dart';
import 'package:stylish/core/utils/app_styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.primaryBackgroungColor,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          Container(
            width: 32,
            height: 32,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(child: Icon(Icons.shopping_cart_outlined)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            Column(
              children: [
                DisplayProductImage(),
                const SizedBox(height: 12),
                IndicatorListView(),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Size: 7UK',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 1.14,
              ),
            ),
            const SizedBox(height: 12),
            SizeListView(),
            const SizedBox(height: 12),
            SizedBox(
              width: 148,
              child: Text(
                'NIke Sneakers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 1.10,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Vision Alta Men’s Shoes Size (All Colours)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                height: 1.14,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                StarRating(rating: 4.5),
                SizedBox(width: 8),
                Text(
                  '56,890',
                  style: TextStyle(
                    color: const Color(0xFF828282),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 1.14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  '₹2,999',
                  style: TextStyle(
                    color: const Color(0xFF808488),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.14,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '₹1,500',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 1.14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '50% Off',
                  style: TextStyle(
                    color: const Color(0xFFF97189),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                    height: 1.14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Product Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                height: 1.14,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 343,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Perhaps the most iconic sneaker of all-time, this original "Chicago"? colorway is the cornerstone to any sneaker collection. Made famous in 1985 by Michael Jordan, the shoe has stood the test of time, becoming the most famous colorway of the Air Jordan 1. This 2015 release saw the',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.33,
                      ),
                    ),
                    TextSpan(
                      text: ' ...',
                      style: TextStyle(
                        color: const Color(0xFF828282),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.33,
                      ),
                    ),
                    TextSpan(
                      text: 'More',
                      style: TextStyle(
                        color: const Color(0xFFF97189),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.33,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
