import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_customize_button.dart';
import 'package:stylish/core/utils/app_routs.dart';

class ProductDetailsCheckoutButtons extends StatelessWidget {
  const ProductDetailsCheckoutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.kProfileScreen);
          },
          child: ProductDetailsCustomizeButton(
            title: 'Go to cart',
            icon: Icons.shopping_cart_outlined,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.kProfileScreen);
          },
          child: ProductDetailsCustomizeButton(
            title: 'Buy Now',
            icon: Icons.touch_app_outlined,
            colorBG: const [Color(0xff71F9A9), Color(0xff31B769)],
          ),
        ),
      ],
    );
  }
}
