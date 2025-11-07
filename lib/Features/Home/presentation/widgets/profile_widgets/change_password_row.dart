import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/utils/app_routs.dart';

class ChangePasswordRow extends StatelessWidget {
  const ChangePasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.push(AppRoutes.kForgetPasswordScreen);
          },
          child: Text(
            'Change Password',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: const Color(0xFFF73658),
              fontSize: 12,
              fontFamily: 'Plus Jakarta Sans',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
