import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/data/models/category_model/category_model.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/core/utils/app_styles.dart';

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
          HomeOfferCardListView(),
          SizedBox(height: 16),
          DealOfDayContainer(),
          SizedBox(height: 16),
          ItemsunderDealOfDayListView(provider: provider),
        ],
      ),
    );
  }
}

class ItemsunderDealOfDayListView extends StatelessWidget {
  const ItemsunderDealOfDayListView({
    super.key,
    required this.provider,
  });

  final HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 242,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 4,
              controller: provider.scrollController,
    
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: SizedBox(
                      width: provider.itemWidth,
                      child: ItemContainerShow(),
                    ),
                  ),
              scrollDirection: Axis.horizontal,
            ),
            Positioned(
              top: 0,
              right: 2,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  provider.scrollNext(4);
                },
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: ShapeDecoration(
                    color: Color(0xffBBBBBB),
                    shape: CircleBorder(
                      side: BorderSide(color: Color(0xffBBBBBB)),
                    ),
                  ),
                  child: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemContainerShow extends StatelessWidget {
  const ItemContainerShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: AppStyles.primaryBackgroungColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            child: Image.asset(
              "assets/icons/woman_clothes_Test.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Women Printed Kurta", style: AppStyles.meduim12),
                SizedBox(height: 4),
                SizedBox(
                  width: 162,

                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "Neque porro quisquam est qui dolorem ipsum quia",
                    style: AppStyles.regular10.copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '₹1500',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    height: 1.33,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '₹2499',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xFFBBBBBB),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        height: 1.33,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '40%Off',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFE735C),
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    StarRating(rating: 4.5, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "56890",
                      style: AppStyles.light12.copyWith(
                        color: Color(0xffA4A9B3),
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Color(0xffA4A9B3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final double size;

  const StarRating({super.key, required this.rating, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        double starValue = index + 1;

        if (rating >= starValue) {
          return Icon(Icons.star, color: Colors.amber, size: size);
        } else if (rating > starValue - 1 && rating < starValue) {
          return Stack(
            children: [
              Icon(
                Icons.star_border,
                color: const Color(0xFFBBBBBB),
                size: size,
              ),
              ClipRect(
                clipper: _HalfClipper(rating - (starValue - 1)),
                child: Icon(
                  Icons.star,
                  color: const Color(0xFFBBBBBB),
                  size: size,
                ),
              ),
            ],
          );
        } else {
          return Icon(
            Icons.star_border,
            color: const Color(0xFFBBBBBB),
            size: size,
          );
        }
      }),
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  final double percent;

  _HalfClipper(this.percent);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * percent, size.height);
  }

  @override
  bool shouldReclip(_HalfClipper oldClipper) => oldClipper.percent != percent;
}

class DealOfDayContainer extends StatelessWidget {
  const DealOfDayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: Color(0xff4392F9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Deal of the Day", style: AppStyles.meduim16),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 13,
                      color: AppStyles.primaryBackgroungColor,
                    ),
                    Text(
                      '  22h 55m 20s remaining ',
                      style: AppStyles.regular12.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            CustomizePrimaryButton(title: 'View all'),
          ],
        ),
      ),
    );
  }
}

class HomeOfferCardListView extends StatelessWidget {
  const HomeOfferCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 189,
          width: 343,

          child: PageView.builder(
            onPageChanged: (value) {
              context.read<HomeProvider>().togglefferCardIndexIndicator(value);
            },
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(left: 1),
                  child: HomeOfferCard(),
                ),
          ),
        ),
        SizedBox(height: 12),
        OfferCardIndexIndicator(),
      ],
    );
  }
}

class OfferCardIndexIndicator extends StatelessWidget {
  const OfferCardIndexIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.all(1.5),
          child:
              context.watch<HomeProvider>().offerCardIndexIndicator == index
                  ? Container(
                    height: 12,
                    width: 12,
                    decoration: ShapeDecoration(
                      color: AppStyles.activesmallContainerColo,
                      shape: CircleBorder(),
                    ),
                  )
                  : Container(
                    height: 9,
                    width: 9,
                    decoration: ShapeDecoration(
                      color: AppStyles.disablemallContainerColo,
                      shape: CircleBorder(),
                    ),
                  ),
        ),
      ),
    );
  }
}

class HomeOfferCard extends StatelessWidget {
  const HomeOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'assets/icons/offerTestbanner.png',
            width: double.infinity,
            // height: double.maxFinite,
          ),
        ),
        Positioned(
          top: 40,
          left: 14,
          child: Text("50-40% OFF", style: AppStyles.regular20),
        ),
        Positioned(
          top: 70,
          left: 14,
          child: Text(
            "Now in (product)",
            style: AppStyles.regular12.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          top: 90,
          left: 14,
          child: Text(
            "All colours",
            style: AppStyles.regular12.copyWith(color: Colors.white),
          ),
        ),
        Positioned(
          top: 117,
          left: 14,
          child: CustomizePrimaryButton(title: "Shop Now"),
        ),
      ],
    );
  }
}

class CustomizePrimaryButton extends StatelessWidget {
  const CustomizePrimaryButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppStyles.primaryBackgroungColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.light12.copyWith(
              color: AppStyles.primaryBackgroungColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_right_alt_outlined,
            color: AppStyles.primaryBackgroungColor,
          ),
        ],
      ),
    );
  }
}

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextField(
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: 'Search any Product..',
          hintStyle: TextStyle(
            color: const Color(0xFFBBBBBB),
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            height: 1.43,
          ),
          prefixIcon: Icon(Icons.search, color: Color(0xFFBBBBBB)),
          suffixIcon: Icon(Icons.mic, color: Color(0xFFBBBBBB)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          hoverColor: Colors.amberAccent,
        ),
      ),
    );
  }
}

class AllFeatureAndFilterRow extends StatelessWidget {
  const AllFeatureAndFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Featured',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              height: 1.22,
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SortContainer(title: "sort", icon: Icons.swap_vert),
              SizedBox(width: 12),
              SortContainer(title: "Filter", icon: Icons.filter_alt_outlined),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Directionality.of(context) == TextDirection.ltr ? 16 : 0,
        right: Directionality.of(context) == TextDirection.rtl ? 16 : 0,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: AlignmentGeometry.centerLeft,
        decoration: ShapeDecoration(
          color: AppStyles.primaryBackgroungColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.horizontal(
              left: Radius.circular(10),
            ),
          ),
        ),
        child: Row(
          children: List.generate(
            categoryList.length,
            (index) => Expanded(
              child: CategoryItem(
                image: categoryList[index].image,
                name: categoryList[index].name,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(child: Image.asset(image)),
        Text(
          name,
          style: AppStyles.regular10.copyWith(color: Color(0xff21003D)),
        ),
      ],
    );
  }
}

class SortContainer extends StatelessWidget {
  const SortContainer({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              height: 1.33,
            ),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}
