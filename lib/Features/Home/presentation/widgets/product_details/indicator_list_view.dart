import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_indicator.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';

class IndicatorListView extends StatelessWidget {
  const IndicatorListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 4),
          child: ProductDetailsIndicator(
            active:
                index ==
                context
                    .read<AppSettingsNotifierProvider>()
                    .productDetailsIndicatorIndex,
          ),
        ),
      ),
    );
  }
}
