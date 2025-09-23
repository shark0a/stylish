import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/customize_primary_button.dart';
import 'package:stylish/core/utils/app_styles.dart';

class MacContainer extends StatelessWidget {
  const MacContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        color: AppStyles.primaryBackgroungColor,
        child: Row(
          children: [
            Image.asset("assets/icons/linearleft.png", fit: BoxFit.fitHeight),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 155,
                color: Color(0xffE7E7EB),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right:
                          Directionality.of(context) == TextDirection.rtl
                              ? -9
                              : null,
                      left:
                          Directionality.of(context) == TextDirection.ltr
                              ? -9
                              : null,
                      child: Image.asset("assets/icons/starrrs.png"),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right:
                          Directionality.of(context) == TextDirection.rtl
                              ? 8
                              : null,
                      left:
                          Directionality.of(context) == TextDirection.ltr
                              ? 8
                              : null,
                      child: Image.asset("assets/icons/helz.png"),
                    ),
                    Positioned(
                      top: 35,
                      left:
                          Directionality.of(context) == TextDirection.rtl
                              ? 15
                              : null,
                      right:
                          Directionality.of(context) == TextDirection.ltr
                              ? 15
                              : null,
                      child: Column(
                        children: [
                          Text(
                            "Flat and Heels",
                            textAlign: TextAlign.center,
                            style: AppStyles.meduim16.copyWith(
                              color: Color(0xFF232327),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Stand a chance to get rewarded",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF232327),
                              fontSize: 10,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                              height: 1.60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 85,
                      left:
                          Directionality.of(context) == TextDirection.rtl
                              ? 13
                              : null,
                      right:
                          Directionality.of(context) == TextDirection.ltr
                              ? 13
                              : null,
                      child: CustomizePrimaryButton(
                        title: "Visit now ",
                        colorBG: AppStyles.changeTextgColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
