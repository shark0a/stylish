import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/customize_primary_button.dart';
import 'package:stylish/core/utils/app_styles.dart';

class HomeOfferCard extends StatelessWidget {
  const HomeOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'assets/icons/offerTestbanner.png',
            width: double.infinity,
            // height: double.maxFinite,
          ),
        ),
        Positioned(
          top: 40,
          left: 14,
          child: Text("50-40% OFF", style: AppStyles.regular20),
        ),
        Positioned(
          top: 70,
          left: 14,
          child: Text(
            "Now in (product)",
            style: AppStyles.regular12.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          top: 90,
          left: 14,
          child: Text(
            "All colours",
            style: AppStyles.regular12.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          top: 117,
          left: 14,
          child: CustomizePrimaryButton(title: "Shop Now"),
        ),
      ],
    );
  }
}
