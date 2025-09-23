import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/core/utils/app_styles.dart';

class OfferCardIndexIndicator extends StatelessWidget {
  const OfferCardIndexIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.all(1.5),
          child:
              context.watch<HomeProvider>().offerCardIndexIndicator == index
                  ? Container(
                    height: 12,
                    width: 12,
                    decoration: ShapeDecoration(
                      color: AppStyles.activesmallContainerColo,
                      shape: CircleBorder(),
                    ),
                  )
                  : Container(
                    height: 9,
                    width: 9,
                    decoration: ShapeDecoration(
                      color: AppStyles.disablemallContainerColo,
                      shape: CircleBorder(),
                    ),
                  ),
        ),
      ),
    );
  }
}
