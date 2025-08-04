import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/presentation/widgets/login_or_creare_row.dart';
import 'package:stylish/Features/auth/presentation/widgets/social_row.dart';
import 'package:stylish/generated/l10n.dart';

class OrContinueWithColumn extends StatelessWidget {
  const OrContinueWithColumn({
    super.key,
    required this.onTap,
    required this.text,
    required this.subtext,
  });
  final void Function()? onTap;
  final String text;
  final String subtext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).ORContinuewith,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF575757),
            fontSize: 15,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20),
        SocialRow(),
        SizedBox(height: 20),
        LoginOrCreareRow(onTap: onTap, text: text, subtext: subtext),
      ],
    );
  }
}
