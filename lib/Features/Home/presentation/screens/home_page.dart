import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/all_feature_and_filter_row.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/category_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/deal_of_day_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/home_offer_card_list_view_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/itemsunder_deal_of_day_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/search_text_filed.dart';

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
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/icons/user-avatar.png'),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SearchTextFiled(),
          AllFeatureAndFilterRow(),
          SizedBox(height: 16),
          CategoryListView(),
          SizedBox(height: 16),
          HomeOfferCardListViewWidget(),
          SizedBox(height: 16),
          DealOfDayContainer(),
          SizedBox(height: 16),
          ItemsunderDealOfDayListView(provider: provider),
        ],
      ),
    );
  }
}
