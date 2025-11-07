import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/cart_widget/cart_product_container.dart';

class CartProductListView extends StatelessWidget {
  const CartProductListView({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
    
        child: RawScrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          radius: const Radius.circular(13),
          thumbColor: Color(0xffBBBBBB),
          fadeDuration: const Duration(milliseconds: 500),
          timeToFade: const Duration(seconds: 1),
          trackColor: Color(0xffE9E9E9),
          trackVisibility: true,
          trackRadius: Radius.circular(11),
          child: ListView.separated(
            controller: _scrollController,
            itemCount: 5,
            padding: EdgeInsets.only(right: 15),
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder:
                (context, index) => const CartProductContainer(),
          ),
        ),
      ),
    );
  }
}
