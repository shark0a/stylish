import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylish/core/utils/app_styles.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppStyles.primaryBackgroungColor,
      highlightColor: AppStyles.textgColorActiveNav.withOpacity(0.2),
      child: Card(
        color: const Color(0xffFDFDFD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة وهمية
            Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 16, width: 120, color: Colors.grey[300]),
                  const SizedBox(height: 6),
                  Container(height: 10, width: 180, color: Colors.grey[300]),
                  const SizedBox(height: 6),
                  Container(height: 12, width: 60, color: Colors.grey[300]),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(height: 14, width: 80, color: Colors.grey[300]),
                      const SizedBox(width: 4),
                      Container(height: 10, width: 30, color: Colors.grey[300]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
