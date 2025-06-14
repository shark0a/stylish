import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_item_models.dart';

class DetailDispaly extends StatelessWidget {
  const DetailDispaly({
    super.key,
    required int index,
    required List<OnBoardItemModels> pages,
  }) : _pages = pages;

  final List<OnBoardItemModels> _pages;
  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(_pages[index].image, height: 250),
          const SizedBox(height: 40),
          Text(
            _pages[index].title,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _pages[index].subtittle,

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
