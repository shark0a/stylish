import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/cart_widget/cart_item_variations_contaioner.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/star_rating.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_sub_title_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';

class CartProductContainer extends StatelessWidget {
  const CartProductContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000),
            blurRadius: 14,
            spreadRadius: -8,
            offset: Offset(0, 6),
          ),
        ],
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 130.53,
                height: 125,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    'assets/icons/woman_clothes_Test.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.27,
                ),
                child: Column(
                  spacing: 7,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailsTitleWidget(
                      title: 'Women’s Casual Wear',
                      fontsize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      spacing: 6,
                      children: [
                        ProductDetailsTitleWidget(
                          title: 'Variations :',
                          fontsize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        CartItemVariationsContaioner(
                          title: 'Black',
                        ),
                        CartItemVariationsContaioner(title: 'Red'),
                      ],
                    ),
                    Row(
                      children: [
                        ProductDetailsTitleWidget(
                          title: '4.8',
                          fontsize: 12,
                        ),
                        const SizedBox(width: 5),
                        StarRating(rating: 4.8, size: 15),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Color(0xffCACACA),
                              ),
                              borderRadius: BorderRadius.circular(
                                4,
                              ),
                            ),
                          ),
                          child: Center(
                            child: ProductDetailsTitleWidget(
                              title: '\$ 34.00',
                              fontsize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            ProductDetailsSubTitleWidget(
                              title: 'upto 33% off',
                              fontsize: 8,
                              color: Color(0xffEB3030),
                            ),
                            const SizedBox(height: 1),
                            ProductDetailsSubTitleWidget(
                              title: '\$ 64.00',
                              fontsize: 12,
                              color: Color(0xffA7A7A7),
                              textDecoration:
                                  TextDecoration.lineThrough,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Color(0xffBBBBBB)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetailsTitleWidget(
                title: "Total Order (1)   :",
                fontsize: 12,
                fontWeight: FontWeight.w500,
              ),
              ProductDetailsTitleWidget(
                title: "\$ 45.00",
                fontsize: 12,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
