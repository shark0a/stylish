import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/data/models/product_model/product_response_model.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/wishlist/card_item.dart';
import 'package:stylish/Features/Home/presentation/widgets/wishlist/shimmer_card.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/app_styles.dart';
import 'package:stylish/core/utils/helper/error/__error_view.dart';
import 'package:stylish/core/utils/helper/error/inline_error.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key, required this.provider});
  final HomeProvider provider;
  @override
  Widget build(BuildContext context) {
    if (provider.isLoading && provider.products.isEmpty) {
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => const ShimmerCard(),
      );
    }
    if (!provider.isLoading &&
        provider.errorMessage != null &&
        provider.products.isEmpty) {
      return ErrorView(
        message: provider.errorMessage!,
        onRetry: () => provider.fetchProducts(),
      );
    }

    final items = context.select<HomeProvider, List<ProductModel>>(
      (p) => p.products,
    );
    final isLoadingMore = context.select<HomeProvider, bool>(
      (p) => p.isLoadingMore,
    );
    final hasMore = context.select<HomeProvider, bool>((p) => p.hasMore);
    final errorMsg = context.select<HomeProvider, String?>(
      (p) => p.errorMessage,
    );

    final tailCount =
        (isLoadingMore || !hasMore || (errorMsg != null && items.isNotEmpty))
            ? 1
            : 0;

    return RefreshIndicator(
      backgroundColor: AppStyles.primaryBackgroungColor,
      color: AppStyles.changeSeconderyTextgColor,
      onRefresh: () => provider.fetchProducts(),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollInfo) {
          if (!provider.isLoadingMore &&
              provider.hasMore &&
              scrollInfo.metrics.pixels >=
                  scrollInfo.metrics.maxScrollExtent - 120) {
            provider.loadMore();
          }
          return false;
        },
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: items.length + tailCount,
          itemBuilder: (context, index) {
            if (index < items.length) {
              return GestureDetector(
                onTap: () {
                  context.push(
                    AppRoutes.kProductDetailsScreen,
                    extra: items[index],
                  );
                },
                child: CardItem(products: items[index]),
              );
            }
            if (isLoadingMore) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppStyles.activesmallContainerColo,
                  ),
                ),
              );
            }
            if (errorMsg != null) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: InlineError(
                  message: errorMsg,
                  onRetry: () => context.read<HomeProvider>().loadMore(),
                ),
              );
            }
            if (!hasMore) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: Text('No more products')),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
