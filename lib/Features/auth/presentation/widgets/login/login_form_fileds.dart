import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/data/manager/cubit/auth_cubit.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/password_text_filed.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/helper/show_snak_helper.dart';

class LoginFormFileds extends StatelessWidget {
  const LoginFormFileds({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    GlobalKey<FormState> formkey = GlobalKey();
    final TextEditingController loginEmailController = TextEditingController();
    final TextEditingController loginPasswordController =
        TextEditingController();
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is AuthCubitSuccess) {
          loginEmailController.clear();
          loginPasswordController.clear();
          showSuccessSnackBar(context, "Login Sucess");
          context.go(AppRoutes.kGetStartScreen);
        }
        if (state is AuthCubitFailure) {
          showErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            children: [
              CustomizeTextFiled(
                controller: loginEmailController,
                hintText: 'Username or Email',
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              PasswordTextFiled(
                controller: loginPasswordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () => context.push(AppRoutes.kForgetPasswordScreen),
                child: const SizedBox(
                  width: 390,
                  child: Text(
                    'Forgot Password?',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFF73658),
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              if (state is AuthCubitLoading)
                const CircularProgressIndicator(color: Color(0xffF83758))
              else
                CustomizeButton(
                  title: 'Login',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      authCubit.login(
                        loginEmailController,
                        loginPasswordController,
                      );
                    }
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
