import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/home_widget/sort_container.dart';

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
