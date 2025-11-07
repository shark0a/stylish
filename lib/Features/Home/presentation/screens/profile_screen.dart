import 'package:flutter/material.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/profile_widgets/checkout_avatar.dart';
import 'package:stylish/Features/Home/presentation/widgets/profile_widgets/checkout_form_filed.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFDFD),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        surfaceTintColor: Color(0xffFDFDFD),
        backgroundColor: const Color(0xffFDFDFD),
        title: const ProductDetailsTitleWidget(
          title: 'Checkout',
          fontsize: 18,
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          CheckoutAvatar(),
          const SizedBox(height: 28),
          ProductDetailsTitleWidget(title: 'Personal Details', fontsize: 18),
          const SizedBox(height: 20),
          CheckoutFormFiled(),
        ],
      ),
    );
  }
}
