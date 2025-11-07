import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';

class CheckoutAvatar extends StatelessWidget {
  const CheckoutAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage:
                  context.read<HomeProvider>().userData?.image == null
                      ? AssetImage('assets/icons/avatar.png')
                      : CachedNetworkImageProvider(
                        context.read<HomeProvider>().userData!.image,
                      ),
              radius: 52,
            ),
            Positioned(
              bottom: 0,
              right: 2,
              child: Container(
                width: 32,
                height: 32,
                decoration: ShapeDecoration(
                  color: Color(0xff4392F9),
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                child: Icon(Icons.edit_outlined, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
