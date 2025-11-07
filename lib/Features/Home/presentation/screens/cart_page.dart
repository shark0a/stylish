import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/cart_widget/cart_delivery_address_add_section.dart';
import 'package:stylish/Features/Home/presentation/widgets/cart_widget/cart_delivery_address_title.dart';
import 'package:stylish/Features/Home/presentation/widgets/cart_widget/cart_product_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/cart_widget/cart_product_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartDeliveryAddressTitle(),
            const SizedBox(height: 12),
            const CartDeliveryAddressAddSection(),
            const SizedBox(height: 24),
            const ProductDetailsTitleWidget(
              title: "Shopping List",
              fontsize: 14,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 24),
            CartProductListView(scrollController: _scrollController),
          ],
        ),
      ),
    );
  }
}
