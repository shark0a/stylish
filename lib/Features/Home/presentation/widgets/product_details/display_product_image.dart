import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class DisplayProductImage extends StatelessWidget {
  const DisplayProductImage({
    super.key,
    required this.imageUrl,
    required this.productImageHeroTag,
  });
  final String imageUrl;
  final int productImageHeroTag;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: 213,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: productImageHeroTag,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.contain,

                    placeholder:
                        (context, url) => Container(
                          color: AppStyles.primaryBackgroungColor,
                          // height: 120,
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
            ),
            Positioned(
              top: 86,
              right:
                  Directionality.of(context) == TextDirection.rtl ? null : 16,
              left: Directionality.of(context) == TextDirection.ltr ? null : 16,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: ShapeDecoration(
                    color: Color(0xffBBBBBB),
                    shape: CircleBorder(
                      side: BorderSide(color: Color(0xffBBBBBB)),
                    ),
                  ),
                  child: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
