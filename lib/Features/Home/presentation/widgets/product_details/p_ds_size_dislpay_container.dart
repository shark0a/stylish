import 'package:flutter/material.dart';
import 'package:stylish/core/utils/app_styles.dart';

class PDsSizeDislpayContainer extends StatelessWidget {
  const PDsSizeDislpayContainer({
    super.key,
    required this.active,
    required this.numOfSize,
  });
  final bool active;
  final int numOfSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: ShapeDecoration(
        color: active ? Color(0xffFA7189) : AppStyles.primaryBackgroungColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: Color(0xffFA7189), width: 1),
        ),
      ),
      child: Text.rich(
        style: TextStyle(
          color: active ? AppStyles.primaryBackgroungColor : Color(0xffFA7189),
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          height: 1.14,
        ),
        TextSpan(text: '$numOfSize ', children: [TextSpan(text: 'UK')]),
      ),
    );
  }
}
