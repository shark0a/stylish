import 'package:flutter/material.dart';

class DisplayProductImage extends StatelessWidget {
  const DisplayProductImage({super.key});

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
              child: Image.asset(
                "assets/icons/cart_image_test.png",
                fit: BoxFit.cover,
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
