import 'package:flutter/material.dart';

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
