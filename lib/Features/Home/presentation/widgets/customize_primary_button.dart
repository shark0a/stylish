import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class CustomizePrimaryButton extends StatelessWidget {
  const CustomizePrimaryButton({super.key, required this.title, this.colorBG});
  final String title;
  final Color? colorBG;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: ShapeDecoration(
        color: colorBG ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: colorBG ?? AppStyles.primaryBackgroungColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.light12.copyWith(
              color: AppStyles.primaryBackgroungColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_right_alt_outlined,
            color: AppStyles.primaryBackgroungColor,
          ),
        ],
      ),
    );
  }
}
