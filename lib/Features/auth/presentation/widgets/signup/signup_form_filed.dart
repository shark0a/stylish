import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/data/manager/cubit/auth_cubit.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/password_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/signup/register_agreegation.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/helper/show_snak_helper.dart';

class SignupFormFiled extends StatelessWidget {
  const SignupFormFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    GlobalKey<FormState> formkey = GlobalKey();
    final TextEditingController signUpEmailController = TextEditingController();
    final TextEditingController signUpPasswordController =
        TextEditingController();
    final TextEditingController signUpPasswordConfirmController =
        TextEditingController();
    return BlocConsumer<AuthCubit, AuthCubitState>(
      listener: (context, state) {
        if (state is AuthCubitFailure) {
          showErrorSnackBar(context, state.errMessage);
        }
        if (state is AuthCubitSuccess) {
          showSuccessSnackBar(context, "Register Successful");
          context.go(AppRoutes.kLoginscreen);
          signUpEmailController.clear();
          signUpPasswordController.clear();
          signUpPasswordConfirmController.clear();
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomizeTextFiled(
                controller: signUpEmailController,
                hintText: 'Username or Email',
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              PasswordTextFiled(
                controller: signUpPasswordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 30),
              PasswordTextFiled(
                controller: signUpPasswordConfirmController,
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 19),
              const RegisterAgreegation(),
              const SizedBox(height: 40),
              if (state is AuthCubitLoading)
                const Center(
                  child: CircularProgressIndicator(color: Color(0xffF83758)),
                )
              else
                CustomizeButton(
                  title: 'Create Account',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      authCubit.signUp(
                        signUpEmailController,
                        signUpPasswordController,
                        signUpPasswordConfirmController,
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
