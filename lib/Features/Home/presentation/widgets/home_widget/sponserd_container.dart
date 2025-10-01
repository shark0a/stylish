import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class SponserdContainer extends StatelessWidget {
  const SponserdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyles.primaryBackgroungColor,
      child: Padding(
        padding: EdgeInsets.only(
          right: Directionality.of(context) == TextDirection.rtl ? 16 : 0,
          left: Directionality.of(context) == TextDirection.ltr ? 16 : 0,
          top: 8,
          bottom: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sponserd',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                height: 1.10,
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                "assets/icons/sponserd.png",
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'up to 50% Off',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded, size: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
