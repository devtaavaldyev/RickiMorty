// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';
import 'package:try_ricki_2/utils/extentions/extension.dart';


class AppListTile extends StatelessWidget {
  AppListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.isSettingsScreen,
    this.activeLeading,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final Function() onTap;
  final bool isSettingsScreen;
  String? activeLeading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      /// TODO Иконкаларды ондоо баарында Колор Айкон болуп калган
      leading: activeLeading == 'theme'
          ? const Icon(
              Icons.color_lens_outlined,
              size: 40,
            )
          : activeLeading == 'lang'
              ? const Icon(
                  Icons.language_rounded,
                  size: 40,
                )
              : null,
      title: Text(
        title,
        style: isSettingsScreen
            ? AppTextStyles.w400size14.copyWith(
                color: context.colors.textColor0B1E2D,
              )
            : AppTextStyles.w400size12.copyWith(
                color: context.colors.textColor828282,
              ),
      ),
      subtitle: Text(
        subtitle,
        style: isSettingsScreen
            ? AppTextStyles.w400size12.copyWith(
                color: context.colors.textColor828282,
              )
            : AppTextStyles.w400size14.copyWith(
                color: context.colors.textColor0B1E2D,
              ),
      ),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
