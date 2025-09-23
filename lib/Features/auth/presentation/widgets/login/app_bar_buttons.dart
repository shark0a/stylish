import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish/Features/auth/presentation/widgets/app_bar_button.dart';
import 'package:stylish/core/provider/app_setting_provider.dart';
import 'package:stylish/generated/l10n.dart';

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(
          onTap: () {
            context.read<AppSettingsNotifierProvider>().toggleLocale();
          },
          fontsize: 20,
          title: S.of(context).ChangeLanguage,
        ),
        AppBarButton(
          fontsize: 20,
          onTap: () {
            context.read<AppSettingsNotifierProvider>().toggleTheme();
          },
          title: S.of(context).ChangeMode,
        ),
      ],
    );
  }
}
