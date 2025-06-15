import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_item_models.dart';

class DetailDispaly extends StatelessWidget {
  const DetailDispaly({super.key, required this.items});

  final OnBoardItemModels items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(items.image, height: 250),
          const SizedBox(height: 40),
          Text(
            items.title,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            items.subtittle,

            textAlign: TextAlign.center,

            style: const TextStyle(
              color: Color(0xFFA8A8A9),
              fontSize: 14,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              height: 1.71,
              letterSpacing: 0.28,
            ),
          ),
        ],
      ),
    );
  }
}
