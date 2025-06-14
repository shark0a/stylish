import 'package:flutter/material.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_item_models.dart';

class OnBoardIndecator extends StatelessWidget {
  const OnBoardIndecator({
    super.key,
    required List<OnBoardItemModels> pages,
    required this.currentIndex,
  }) : _pages = pages;

  final List<OnBoardItemModels> _pages;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        _pages.length,
        (index) =>
            currentIndex == index
                ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 40,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: Colors.black,
                  ),
                )
                : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                ),
      ),
    );
  }
}
