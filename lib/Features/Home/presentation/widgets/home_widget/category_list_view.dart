import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/data/models/category_model/category_model.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/category_item.dart';
import 'package:stylish/core/utils/app_styles.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Directionality.of(context) == TextDirection.ltr ? 16 : 0,
        right: Directionality.of(context) == TextDirection.rtl ? 16 : 0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: AlignmentGeometry.centerLeft,
        decoration: ShapeDecoration(
          color: AppStyles.primaryBackgroungColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.horizontal(
              left: Radius.circular(10),
            ),
          ),
        ),
        child: Row(
          children: List.generate(
            categoryList.length,
            (index) => Expanded(
              child: CategoryItem(
                image: categoryList[index].image,
                name: categoryList[index].name,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
