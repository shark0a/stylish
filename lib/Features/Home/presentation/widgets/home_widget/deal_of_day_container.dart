import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/customize_primary_button.dart';
import 'package:stylish/core/utils/app_styles.dart';

class DealOfDayContainer extends StatelessWidget {
  const DealOfDayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Color(0xff4392F9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deal of the Day", style: AppStyles.meduim16),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 13,
                      color: AppStyles.primaryBackgroungColor,
                    ),
                    Text(
                      '  22h 55m 20s remaining ',
                      style: AppStyles.regular12.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            CustomizePrimaryButton(title: 'View all'),
          ],
        ),
      ),
    );
  }
}
