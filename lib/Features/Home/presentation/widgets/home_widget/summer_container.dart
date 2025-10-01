import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/customize_primary_button.dart';
import 'package:stylish/core/utils/app_styles.dart';

class SummerContainer extends StatelessWidget {
  const SummerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyles.primaryBackgroungColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              "assets/icons/summerImage.png",
              height: 204,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'New Arrivals ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                height: 1.10,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Summer’ 25 Collections',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),
                CustomizePrimaryButton(
                  title: 'View all ',
                  colorBG: AppStyles.changeTextgColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
        ],
      ),
    );
  }
}
