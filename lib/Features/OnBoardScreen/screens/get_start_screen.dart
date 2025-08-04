import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/core/utils/app_routs.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
        ),

        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage('assets/icons/GetStart_backG.png'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 362,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                      Colors.black54,
                      Colors.black54,
                      Colors.black54,
                      Colors.black54,
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2),

                    Text(
                      'You want \nAuthentic, here \nyou go!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 3,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Find it here, buy it now!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFF2F2F2),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        height: 1.54,
                        letterSpacing: 0.14,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.go(AppRoutes.kHomePage);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF83758),
                        fixedSize: Size(279, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(4),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
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
