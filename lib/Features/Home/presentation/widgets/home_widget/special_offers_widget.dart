import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class SpecialOffersWidget extends StatelessWidget {
  const SpecialOffersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: ShapeDecoration(
          color: AppStyles.primaryBackgroungColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Row(
          children: [
            Image.asset("assets/icons/special_offer.png"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Special Offers",
                      style: AppStyles.meduim16.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Image.asset("assets/icons/woooo.png"),
                  ],
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 171,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    'We make sure you get the offer you need at best prices',
                    style: AppStyles.light12.copyWith(
                      color: Colors.black,
                      fontSize: 12,
                      height: 1.33,

                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
