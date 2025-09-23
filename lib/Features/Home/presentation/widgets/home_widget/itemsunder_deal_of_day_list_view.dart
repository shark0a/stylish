import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/item_container_show.dart';

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
