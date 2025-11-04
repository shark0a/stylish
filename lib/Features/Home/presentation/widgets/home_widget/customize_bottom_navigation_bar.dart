import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/core/utils/app_styles.dart';

class CustomizeBottomNavigationBar extends StatelessWidget {
  const CustomizeBottomNavigationBar({super.key, required this.provider});

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppStyles.primaryBackgroungColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      enableFeedback: false,

      elevation: 1,
      selectedItemColor: Color(0xFFEA3030),
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        color: const Color(0xFFEA3030),
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.40,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.40,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: provider.bottomNavigationbarIndex,
      onTap: (value) {
        if (value == 1) {
          provider.fetchProducts(firstLoad: true);
        }
        provider.setbottomNavigationbarIndex(value);
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: "Wishlist",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            // alignment: Alignment.center,
            children: [
              const SizedBox(width: 53.85, height: 56),
              Positioned(
                // top: -10,
                bottom: 24,
                child: Container(
                  width: 53.85,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppStyles.primaryBackgroungColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x16000000),
                        blurRadius: 14,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(child: Icon(Icons.shopping_cart_outlined)),
                ),
              ),
            ],
          ),
          label: "",
          activeIcon: Stack(
            clipBehavior: Clip.none,
            // alignment: Alignment.center,
            children: [
              const SizedBox(width: 53.85, height: 56),
              Positioned(
                // top: -10,
                bottom: 24,
                child: Container(
                  width: 53.85,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xffEB3030),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x16000000),
                        blurRadius: 14,
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: "Setting",
        ),
      ],
    );
  }
}
