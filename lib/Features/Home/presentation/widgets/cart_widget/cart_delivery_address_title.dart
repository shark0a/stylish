import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';

class CartDeliveryAddressTitle extends StatelessWidget {
  const CartDeliveryAddressTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: Colors.black, size: 15),
        const SizedBox(width: 8),
        ProductDetailsTitleWidget(
          title: "Delivery Address",
          fontsize: 14,
        ),
      ],
    );
  }
}
