import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/all_feature_and_filter_row.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/category_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/deal_of_day_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/home_offer_card_list_view_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/itemsunder_deal_of_day_list_view.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/mac_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/search_text_filed.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/special_offers_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/sponserd_container.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/summer_container.dart';

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
          const SizedBox(height: 16),
          CategoryListView(),
          const SizedBox(height: 16),
          HomeOfferCardListViewWidget(),
          const SizedBox(height: 16),
          DealOfDayContainer(
            title: "Deal of the Day",
            subtitle: '  22h 55m 20s remaining ',
            buttontitle: 'View all',
            subtitleIcon: Icons.alarm,
          ),
          const SizedBox(height: 16),
          ItemsunderDealOfDayListView(provider: provider),
          const SizedBox(height: 16),
          SpecialOffersWidget(),
          const SizedBox(height: 16),
          MacContainer(),
          const SizedBox(height: 16),
          DealOfDayContainer(
            title: "Trending Products ",
            subtitle:
                '  Last Date ${DateFormat("dd-MM-yy").format(DateTime.now())} ',
            buttontitle: 'View all',
            subtitleIcon: Icons.calendar_month_outlined,
            containerColor: Color(0xffFD6E87),
          ),
          const SizedBox(height: 16),
          ItemsunderDealOfDayListView(provider: provider),
          const SizedBox(height: 16),
          SummerContainer(),
          const SizedBox(height: 16),
          SponserdContainer(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
