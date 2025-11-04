import 'package:flutter/material.dart';

class ProductDetailsCustomizeButton extends StatelessWidget {
  const ProductDetailsCustomizeButton({
    super.key,
    this.onTap,
    required this.title,
    this.colorBG,
    required this.icon,
  });
  final void Function()? onTap;
  final String title;
  final IconData icon;
  final List<Color>? colorBG;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 136,
        height: 40,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 2,
              child: Container(
                width: 136,
                height: 36,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:
                        colorBG ??
                        [const Color(0xFF3E92FF), const Color(0xFF0B3689)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(4),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      bottom: 8,
                      right: 8,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:
                        colorBG ??
                        [const Color(0xFF3E92FF), const Color(0xFF0B3689)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(99),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
