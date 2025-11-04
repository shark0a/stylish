import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';
import 'package:stylish/core/utils/app_styles.dart';

class ProductDetailsDeliveryInContainer extends StatelessWidget {
  const ProductDetailsDeliveryInContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27, vertical: 11),
      decoration: ShapeDecoration(
        color: AppStyles.fFCCD5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ProductDetailsTitleWidget(
            title: 'Delivery in ',
            fontsize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 6),
          ProductDetailsTitleWidget(
            title: '1 within Hour',
            fontsize: 21,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
