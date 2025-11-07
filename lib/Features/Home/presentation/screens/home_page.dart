import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/screens/cart_page.dart';
import 'package:stylish/Features/Home/presentation/screens/search_page.dart';
import 'package:stylish/Features/Home/presentation/screens/setting_page.dart';
import 'package:stylish/Features/Home/presentation/screens/wishlist_page.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/customize_bottom_navigation_bar.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/home_body.dart';
import 'package:stylish/core/utils/app_routs.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SvgPicture.asset(
          'assets/icons/drawer_icon.svg',
          fit: BoxFit.scaleDown,
        ),
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/app-bar-icon.svg'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () => context.push(AppRoutes.kProfileScreen),
              child: CircleAvatar(
                backgroundImage:
                    provider.userData?.image == null
                        ? AssetImage('assets/icons/user-avatar.png')
                        : CachedNetworkImageProvider(provider.userData!.image),
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: provider.bottomNavigationbarIndex,
        children: [
          HomeBody(provider: provider),
          WishlistPage(provider: provider),
          CartPage(),
          SearchPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: CustomizeBottomNavigationBar(provider: provider),
    );
  }
}
