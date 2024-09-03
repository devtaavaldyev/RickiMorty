// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:try_ricki_2/config/l10n/generated/l10n.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';
import 'package:try_ricki_2/config/theme/theme_provider.dart';
import 'package:try_ricki_2/features/presentation/screens/settings_screen/edit_screen/widgets/edit_text_field.dart';

import 'package:try_ricki_2/utils/extentions/extension.dart';
import 'package:try_ricki_2/config/language/language_provider.dart';
import 'package:try_ricki_2/features/presentation/widgets/app_list_tile.dart';

part 'profile_screen/profile_screen.dart';
part 'widgets/alert_widget.dart';
part 'widgets/language_widget.dart';
part 'edit_screen/edit_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.lightFCFCFC,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          Language.of(context).settings,
          style: AppTextStyles.w500size20.copyWith(
            color: context.colors.textColor0B1E2D,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.height * 0.008),
              SizedBox(height: context.height * 0.021),
              Row(
                children: [
                  CircleAvatar(
                    foregroundImage:
                        imageGallery != null ? FileImage(imageGallery!) : null,
                    backgroundImage: const NetworkImage(
                        'http://zornet.ru/_fr/19/0382514.png'),
                    radius: context.height * 0.045,
                  ),
                  SizedBox(width: context.height * 0.018),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oleg Belotserkovsky',
                        style: AppTextStyles.w400size16.copyWith(
                          color: context.colors.textColor0B1E2D,
                        ),
                      ),
                      Text(
                        'Rick',
                        style: AppTextStyles.w400size14.copyWith(
                          color: context.colors.textColor828282,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.033,
              ),
              SizedBox(
                height: context.height * 0.044,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: context.colors.buttonColors),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    Language.of(context).edit,
                    style: AppTextStyles.w400size16.copyWith(
                      color: context.colors.buttonColors,
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.height * 0.025),
              const Divider(
                thickness: 1,
              ),
              SizedBox(height: context.height * 0.018),
              Text(
                Language.of(context).appearance,
                style: AppTextStyles.w500size10.copyWith(
                  color: context.colors.textColor828282,
                ),
              ),
              SizedBox(height: context.height * 0.005),
              AppListTile(
                title: Language.of(context).darkTheme,
                // TODO ПереРаботать Текст по выбранной темой!
                subtitle: Language.of(context).enabled,
                onTap: () {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertWidget();
                    },
                  );
                },
                isSettingsScreen: true,
                activeLeading: 'theme',
              ),
              SizedBox(height: context.height * 0.005),
              Text(
                Language.of(context).languages,
                style: AppTextStyles.w500size10.copyWith(
                  color: context.colors.textColor828282,
                ),
              ),
              const LanguageWidget(),
              SizedBox(height: context.height * 0.010),
              const Divider(
                thickness: 1,
              ),
              SizedBox(height: context.height * 0.025),
              Text(
                Language.of(context).aboutTheApplication,
                style: AppTextStyles.w500size10.copyWith(
                  color: context.colors.textColor828282,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                style: AppTextStyles.w400size13.copyWith(
                  color: context.colors.textColor0B1E2D,
                ),
              ),
              SizedBox(height: context.height * 0.025),
              const Divider(
                thickness: 1,
              ),
              SizedBox(height: context.height * 0.025),
              Text(
                Language.of(context).applicationVersion,
                style: AppTextStyles.w500size10.copyWith(
                  color: context.colors.textColor828282,
                ),
              ),
              SizedBox(height: context.height * 0.025),
              Text(
                'Rick & Morty  v1.0.0',
                style: AppTextStyles.w400size13.copyWith(
                  color: context.colors.textColor0B1E2D,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
