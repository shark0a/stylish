import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/OnBoardScreen/on_board_item_models.dart';
import 'package:stylish/Features/OnBoardScreen/widget/detail_dispaly.dart';
import 'package:stylish/Features/OnBoardScreen/widget/on_board_header.dart';
import 'package:stylish/Features/OnBoardScreen/widget/on_board_indecator.dart';
import 'package:stylish/core/service/services_locator.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/helper/shared_pref_key.dart';
import 'package:stylish/core/utils/shared_pref.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnBoardItemModels> _pages = [
    OnBoardItemModels(
      image: "assets/icons/shop-1.svg",
      title: "Choose Products",
      subtittle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),

    OnBoardItemModels(
      image: "assets/icons/shop-2.svg",
      title: "Make Payment",
      subtittle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),

    OnBoardItemModels(
      image: "assets/icons/shop-3.png",
      title: "Get Your Order",
      subtittle:
          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
    ),
  ];

  void _nextPage() {
    if (currentIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.slowMiddle,
      );
    } else {
      if ((sl.get<SharedPref>().getBool(SharedPrefKey.isLogin)) ?? false) {
        context.go(AppRoutes.kHomePage);
      } else {
        context.go(AppRoutes.kLoginscreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (context, index) {
              return DetailDispaly(items: _pages[currentIndex]);
            },
          ),
          OnBoardHeader(currentIndex: currentIndex, pages: _pages),
          Positioned(
            top: 60,
            right: 24,
            child: TextButton(
              onPressed: () async {
                await sl.get<SharedPref>().setBool(
                  SharedPrefKey.isfirstTime,
                  true,
                );
                if (!context.mounted) return;
                context.go(AppRoutes.kLoginscreen);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed:
                      currentIndex > 0
                          ? () => _controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          )
                          : null,
                  child: const Text(
                    'Prev',
                    style: TextStyle(
                      color: Color(0xFFC4C4C4),
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                OnBoardIndecator(pages: _pages, currentIndex: currentIndex),
                TextButton(
                  onPressed: _nextPage,
                  child: Text(
                    textAlign: TextAlign.center,
                    currentIndex == _pages.length - 1 ? 'Get Started' : 'Next',
                    style: const TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
