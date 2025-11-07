import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_sub_title_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/profile_widgets/customize_text_form_filed.dart';

class CustomizeTextFieldWithTitle extends StatelessWidget {
  const CustomizeTextFieldWithTitle({
    super.key,
    required this.title,
    this.textEditingController,
    this.obscureText,
    this.validator,
  });
  final String title;
  final TextEditingController? textEditingController;
  final bool? obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsSubTitleWidget(
          title: title,
          fontsize: 12,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 15),
        CustomizeTextFormFiled(
          textEditingController: textEditingController,
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
