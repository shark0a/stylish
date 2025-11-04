import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/all_feature_and_filter_row.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/itemsunder_deal_of_day_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/display_product_image.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/indicator_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/produc_details_similler_buttons_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_button_row.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_delivery_in_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_sections.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_sub_title_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/size_list_view.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';
import 'package:stylish/core/utils/app_styles.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = GoRouter.of(context).state.extra as ProductModel;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: AppStyles.primaryBackgroungColor,
        surfaceTintColor: AppStyles.primaryBackgroungColor,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Container(
            width: 32,
            height: 32,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            child: Center(child: Icon(Icons.shopping_cart_outlined)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: ListView(
          children: [
            Column(
              children: [
                DisplayProductImage(
                  productImageHeroTag: product.id,
                  imageUrl:
                      product.images.isNotEmpty
                          ? product.images.first
                          : product.thumbnail,
                ),
                const SizedBox(height: 12),
                IndicatorListView(),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Size: 7UK',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 1.14,
              ),
            ),
            const SizedBox(height: 12),
            SizeListView(),
            const SizedBox(height: 12),
            ProductDetailsTitleWidget(
              title: product.title ?? 'is null',
              fontsize: 20,
            ),
            const SizedBox(height: 12),
            ProductDetailsSubTitleWidget(
              title: product.category ?? 'Category is null',
              fontsize: 14,
            ),
            const SizedBox(height: 12),
            ProductDetailsSections(
              rating: product.rating ?? 0.0,
              totalReviews:
                  product.rating != null
                      ? (product.rating! * 50).toDouble()
                      : 0,
              pricewithDiscount:
                  product.discountPercentage == null
                      ? null
                      : product.discountPercentage! / 100 * product.price!,

              discountpresentage: product.discountPercentage,
              pricewithOutDiscount: product.price!,
              description: product.description ?? 'Description is null',
            ),
            const SizedBox(height: 12),
            ProductDetailsButtonRow(),
            const SizedBox(height: 12),
            ProductDetailsDeliveryInContainer(),
            const SizedBox(height: 12),
            ProducDetailsSimillerButtonsView(),
            const SizedBox(height: 24),
            context
                    .watch<AppSettingsNotifierProvider>()
                    .isProductScreenViewSimillerTaped
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailsTitleWidget(
                      title: 'Similar To',
                      fontsize: 20,
                    ),
                    AllFeatureAndFilterRow(title: '282+ Iteams '),
                    const SizedBox(height: 12),
                    const SizedBox(height: 12),
                    ItemsunderDealOfDayListView(
                      provider: context.read<HomeProvider>(),
                    ),
                  ],
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
