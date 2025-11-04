import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/p_ds_size_dislpay_container.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';

class SizeListView extends StatelessWidget {
  const SizeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: GestureDetector(
            onTap:
                () => context
                    .read<AppSettingsNotifierProvider>()
                    .toggleProductDetailsIndicatorIndex(index),
            child: PDsSizeDislpayContainer(
              numOfSize: index + 6,
              active:
                  index ==
                  context
                      .read<AppSettingsNotifierProvider>()
                      .productDetailsIndicatorIndex,
            ),
          ),
        ),
      ),
    );
  }
}
