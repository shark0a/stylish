import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';

class CartDeliveryAddressAddSection extends StatelessWidget {
  const CartDeliveryAddressAddSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000),
                  blurRadius: 14,
                  spreadRadius: -8,
                  offset: Offset(0, 6),
                ),
              ],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.edit_square, size: 12)],
                ),
                ProductDetailsTitleWidget(
                  title: "Address:",
                  fontsize: 12,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 4),
                ProductDetailsTitleWidget(
                  title:
                      context
                          .read<HomeProvider>()
                          .userData
                          ?.address
                          .address ??
                      'No Address',
                  fontsize: 12,
                  fontWeight: FontWeight.w400,
                ),
                ProductDetailsTitleWidget(
                  title:
                      'Contact: ${context.read<HomeProvider>().userData?.phone ?? 'No phone'}',
                  fontsize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(27),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000),
                  blurRadius: 14,
                  spreadRadius: -8,
                  offset: Offset(0, 6),
                ),
              ],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Icon(Icons.add_circle_outline_rounded, size: 24),
            ),
          ),
        ),
      ],
    );
  }
}
