import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_customize_button.dart';

class ProductDetailsButtonRow extends StatelessWidget {
  const ProductDetailsButtonRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProductDetailsCustomizeButton(
          title: 'Go to cart',
          icon: Icons.shopping_cart_outlined,
        ),
        const SizedBox(width: 12),
        ProductDetailsCustomizeButton(
          title: 'Buy Now',
          icon: Icons.touch_app_outlined,
          colorBG: const [Color(0xff71F9A9), Color(0xff31B769)],
        ),
      ],
    );
  }
}
