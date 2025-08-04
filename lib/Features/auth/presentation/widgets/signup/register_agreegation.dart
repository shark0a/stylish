import 'package:flutter/material.dart';
import 'package:stylish/generated/l10n.dart'; // تأكد المسار ده صح حسب مشروعك

class RegisterAgreegation extends StatelessWidget {
  const RegisterAgreegation({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.start,
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).RegisterAgreementPart1,
            style: const TextStyle(
              color: Color(0xFF676767),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: S.of(context).RegisterAgreementButton,
            style: const TextStyle(
              color: Color(0xFFFF4B26),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: S.of(context).RegisterAgreementPart2,
            style: const TextStyle(
              color: Color(0xFF676767),
              fontSize: 12,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
