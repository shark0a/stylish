import 'package:flutter/material.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/utils/validitor_functions.dart';

class LoginFormFileds extends StatefulWidget {
  const LoginFormFileds({super.key});

  @override
  State<LoginFormFileds> createState() => _LoginFormFiledsState();
}

class _LoginFormFiledsState extends State<LoginFormFileds> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUnfocus,
            validator: ValiditorFunctions.validateEmail,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff626262)),
              ),
              hintText: 'Username or Email',
              hintStyle: TextStyle(
                color: const Color(0xFF676767),
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 15,
                ),
                child: Icon(Icons.person, size: 30, color: Color(0xff626262)),
              ),
              fillColor: Color(0xffF3F3F3),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            validator: ValiditorFunctions.validatePassword,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff626262)),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: const Color(0xFF676767),
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 15,
                ),
                child: Icon(
                  Icons.remove_red_eye_outlined,
                  size: 30,
                  color: Color(0xff626262),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 15,
                ),
                child: Icon(Icons.lock, size: 30, color: Color(0xff626262)),
              ),
              fillColor: Color(0xffF3F3F3),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 390,
            child: Text(
              'Forgot Password?',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: const Color(0xFFF73658),
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 50),
          CustomizeAuthButton(
            title: 'Login',
            onTap: () {
              if (formkey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
