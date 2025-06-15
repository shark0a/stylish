import 'package:flutter/material.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});
  final List<String> iconsurl = const [
    "assets/icons/google 1.png",
    "assets/icons/facebook 1.png",
    "assets/icons/apple 1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(iconsurl.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xffFCF3F6),
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xffF83758), width: 1.5),
            ),
            child: Center(
              child: Image.asset(iconsurl[index], fit: BoxFit.cover),
            ),
          ),
        );
      }),
    );
  }
}
