import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylish/Features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_auth_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/customize_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/password_text_filed.dart';
import 'package:stylish/Features/auth/presentation/widgets/signup/register_agreegation.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/core/utils/helper/show_snak_helper.dart';
import 'package:stylish/generated/l10n.dart';

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
          showSuccessSnackBar(context, S.of(context).AuthCubitSignupSuccess);
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
                hintText: S.of(context).UsernameorEmail,
                icon: Icons.person,
              ),
              const SizedBox(height: 30),
              PasswordTextFiled(
                controller: signUpPasswordController,
                hintText: S.of(context).PasswordTextFiled,
              ),
              const SizedBox(height: 30),
              PasswordTextFiled(
                controller: signUpPasswordConfirmController,
                hintText: S.of(context).PasswordTextFiledConfirm,
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
                  title: S.of(context).CreateAccountButton,
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
