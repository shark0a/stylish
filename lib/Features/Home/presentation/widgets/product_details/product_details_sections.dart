import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/price_details_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_nesr_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_rate_row_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_section.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_sub_title_widget.dart';

final List nerestStoreItems = const [
  {'icon': Icons.location_on_outlined, 'title': 'Nearest Store'},
  {'icon': Icons.lock_outline, 'title': 'VIP'},
  {'icon': Icons.cached_outlined, 'title': 'Return policy'},
];

class ProductDetailsSections extends StatelessWidget {
  const ProductDetailsSections({
    super.key,
    required this.description,
    required this.rating,
    this.totalReviews,
    this.pricewithDiscount,
    this.discountpresentage,
    this.pricewithOutDiscount,
  });
  final String description;
  final double rating;
  final double? totalReviews;
  final double? pricewithDiscount;
  final double? discountpresentage;
  final double? pricewithOutDiscount;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsRateRowWidget(rating: rating, totalReviews: totalReviews),
        const SizedBox(height: 12),
        PriceDetailsWidget(
          pricewithDiscount: pricewithDiscount,
          discountpresentage: discountpresentage,
          pricewithOutDiscount: pricewithOutDiscount,
        ),
        const SizedBox(height: 8),
        ProductDetailsSubTitleWidget(
          title: 'Product Details',
          fontsize: 14,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 4),
        ProductDescriptionSection(description: description),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ProductDetailsNesrContainer(
                icon: nerestStoreItems[index]['icon'],
                title: nerestStoreItems[index]['title'],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
