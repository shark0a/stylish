import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/Home/presentation/manager/home_provider.dart';
import 'package:stylish/Features/Home/presentation/widgets/product_details/product_details_title_widget.dart';
import 'package:stylish/Features/Home/presentation/widgets/profile_widgets/change_password_row.dart';
import 'package:stylish/Features/Home/presentation/widgets/profile_widgets/customize_text_field_with_title.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';

class CheckoutFormFiled extends StatefulWidget {
  const CheckoutFormFiled({super.key});

  @override
  State<CheckoutFormFiled> createState() => _CheckoutFormFiledState();
}

TextEditingController? emailController;
TextEditingController? passwordController;
TextEditingController? pincodeController;
TextEditingController? addressController;
TextEditingController? cityController;
TextEditingController? stateController;
TextEditingController? countryController;
TextEditingController? bankAccountNumberController;
TextEditingController? accountHolderNameController;
TextEditingController? ifscCodeController;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _CheckoutFormFiledState extends State<CheckoutFormFiled> {
  @override
  Widget build(BuildContext context) {
    final userData = context.read<HomeProvider>().userData;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomizeTextFieldWithTitle(
            title: 'Email Address',
            textEditingController:
                emailController = TextEditingController(
                  text: userData?.email ?? '',
                ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your email';
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'Password',
            obscureText: true,
            textEditingController:
                passwordController = TextEditingController(
                  text: userData?.password ?? '',
                ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your password';
              }
              final passwordRegex = RegExp(
                r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$',
              );
              if (!passwordRegex.hasMatch(value)) {
                return 'Password must be at least 8 characters,\ninclude upper & lower case letters, and a number';
              }
              return null;
            },
          ),
          const SizedBox(height: 14),
          ChangePasswordRow(),
          const SizedBox(height: 34),
          Divider(color: Color(0xffC4C4C4)),
          const SizedBox(height: 34),
          ProductDetailsTitleWidget(
            title: 'Business Address Details',
            fontsize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 22),
          CustomizeTextFieldWithTitle(
            title: 'Pincode',
            textEditingController:
                pincodeController = TextEditingController(
                  text: userData?.address.postalCode ?? '',
                ),
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'Address',
            textEditingController:
                addressController = TextEditingController(
                  text: userData?.address.address ?? '',
                ),
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'City',
            textEditingController:
                cityController = TextEditingController(
                  text: userData?.address.city ?? '',
                ),
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'State',
            textEditingController:
                stateController = TextEditingController(
                  text: userData?.address.state ?? '',
                ),
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'Country',
            textEditingController:
                countryController = TextEditingController(
                  text: userData?.address.country ?? '',
                ),
          ),
          const SizedBox(height: 34),
          Divider(color: Color(0xffC4C4C4)),
          const SizedBox(height: 32),
          ProductDetailsTitleWidget(
            title: 'Bank Account Details',
            fontsize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 24),
          CustomizeTextFieldWithTitle(
            title: 'Bank Account Number',
            textEditingController:
                bankAccountNumberController = TextEditingController(
                  text: userData?.bank.cardNumber ?? '',
                ),
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'Account Holder’s Name',
            textEditingController:
                accountHolderNameController = TextEditingController(
                  text: userData?.username ?? '',
                ),
          ),
          const SizedBox(height: 28),
          CustomizeTextFieldWithTitle(
            title: 'IFSC Code',
            textEditingController:
                ifscCodeController = TextEditingController(
                  text: userData?.bank.iban ?? '',
                ),
          ),
          const SizedBox(height: 34),
          CustomizeButton(
            onTap: () {
              if (formKey.currentState!.validate()) {}
            },
            title: 'Save',
          ),
          const SizedBox(height: 57),
        ],
      ),
    );
  }
}
