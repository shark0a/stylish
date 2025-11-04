import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_view_similar_container.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';

class ProducDetailsSimillerButtonsView extends StatelessWidget {
  const ProducDetailsSimillerButtonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        2,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  context
                      .read<AppSettingsNotifierProvider>()
                      .toggleisProductScreenViewSimillerTaped();
                } else {}
              },
              child: ProductDetailsViewSimilarContainer(
                icon:
                    index == 0
                        ? Icons.remove_red_eye_outlined
                        : Icons.style_outlined,
                title: index == 0 ? 'View Similar' : 'Add to Compare',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
