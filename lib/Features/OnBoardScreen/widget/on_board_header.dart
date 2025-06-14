import 'package:flutter/material.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_item_models.dart';

class OnBoardHeader extends StatelessWidget {
  const OnBoardHeader({
    super.key,
    required this.currentIndex,
    required List<OnBoardItemModels> pages,
  }) : _pages = pages;

  final int currentIndex;
  final List<OnBoardItemModels> _pages;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      left: 24,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: (currentIndex + 1).toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: '/${_pages.length}',
              style: TextStyle(
                color: const Color(0xFFA0A0A1),
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
