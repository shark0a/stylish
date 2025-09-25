import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppStyles.primaryBackgroungColor,
        child: Text(
          "Page under the building....! ",
          style: AppStyles.regular20.copyWith(
            color: AppStyles.primaryTextgColor,
          ),
        ),
      ),
    );
  }
}
