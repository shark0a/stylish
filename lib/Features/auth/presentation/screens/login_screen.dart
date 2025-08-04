import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/auth/presentation/widgets/app_bar_button.dart';
import 'package:stylish/Features/auth/presentation/widgets/auth_header.dart';
import 'package:stylish/Features/auth/presentation/widgets/login/login_form_fileds.dart';
import 'package:stylish/Features/auth/presentation/widgets/or_continue_with_column.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';
import 'package:stylish/core/utils/app_routs.dart';
import 'package:stylish/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: const SizedBox(height: 30)),
              AppBarButtons(),
              SizedBox(height: 30),
              AuthHeader(
                title: S.of(context).AuthLoginHeaderTitle,
                color: Colors.black,
              ),
              SizedBox(height: 30),
              LoginFormFileds(),
              SizedBox(height: 30),
              OrContinueWithColumn(
                onTap: () {
                  context.push(AppRoutes.kSignUpScreen);
                },
                text: S.of(context).OrContinueWithLoginColumnTitle,
                subtext: S.of(context).OrContinueWithLoginColumnsubtext,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(
          onTap: () {
            context.read<AppSettingsNotifier>().toggleLocale();
          },
          fontsize: 20,
          title: S.of(context).ChangeLanguage,
        ),
        AppBarButton(
          fontsize: 20,
          onTap: () {
            context.read<AppSettingsNotifier>().toggleTheme();
          },
          title: S.of(context).ChangeMode,
        ),
      ],
    );
  }
}
