import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int offerCardIndexIndicator = 0;
  void togglefferCardIndexIndicator(int index) {
    offerCardIndexIndicator = index;
    notifyListeners();
  }

  ///item scroll button handle
  final ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  final double itemWidth = 160;

  void scrollNext(int itemCount) {
    if (currentIndex < itemCount - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    _animateToIndex();
  }

  void _animateToIndex() {
    scrollController.animateTo(
      currentIndex * (itemWidth + 12),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void scrollPrevious() {
    if (currentIndex > 0) {
      currentIndex--;
      _animateToIndex();
    }
  }
}
