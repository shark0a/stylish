import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/star_rating.dart';
import 'package:stylish/core/utils/app_styles.dart';

class ItemContainerShow extends StatelessWidget {
  const ItemContainerShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppStyles.primaryBackgroungColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            child: Image.asset(
              "assets/icons/woman_clothes_Test.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Women Printed Kurta", style: AppStyles.meduim12),
                SizedBox(height: 4),
                SizedBox(
                  width: 162,

                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "Neque porro quisquam est qui dolorem ipsum quia",
                    style: AppStyles.regular10.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '₹1500',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹2499',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xFFBBBBBB),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        height: 1.33,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '40%Off',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFE735C),
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    StarRating(rating: 4.5, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "56890",
                      style: AppStyles.light12.copyWith(
                        color: Color(0xffA4A9B3),
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xffA4A9B3),
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
