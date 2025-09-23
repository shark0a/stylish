import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/home_offer_card.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/offer_card_index_indicator.dart';

class HomeOfferCardListViewWidget extends StatelessWidget {
  const HomeOfferCardListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 189,
          width: 343,

          child: PageView.builder(
            onPageChanged: (value) {
              context.read<HomeProvider>().togglefferCardIndexIndicator(value);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: HomeOfferCard(),
                ),
          ),
        ),
        SizedBox(height: 12),
        OfferCardIndexIndicator(),
      ],
    );
  }
}
