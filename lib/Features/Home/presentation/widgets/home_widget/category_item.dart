import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(child: Image.asset(image)),
        Text(
          name,
          style: AppStyles.regular10.copyWith(color: Color(0xff21003D)),
        ),
      ],
    );
  }
}
