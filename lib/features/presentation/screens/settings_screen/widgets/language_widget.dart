part of '../settings_screen.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LanguageProvider>();
    return AppListTile(
      title: Language.of(context).choiceLanguage,
      subtitle: Language.of(context).languages,
      onTap: () {
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: context.colors.lightFCFCFC,
              contentPadding: EdgeInsets.zero,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChekLanguage(
                    isActive: vm.currentLocale == const Locale('en'),
                    lang: LanguageEnum.en,
                  ),
                  ChekLanguage(
                    isActive: vm.currentLocale == const Locale('ru'),
                    lang: LanguageEnum.ru,
                  ),
                  ChekLanguage(
                    isActive: vm.currentLocale == const Locale('ky'),
                    lang: LanguageEnum.ky,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Ok',
                    style: AppTextStyles.w500size14
                        .copyWith(color: context.colors.textColor0B1E2D),
                  ),
                ),
              ],
            );
          },
        );
      },
      isSettingsScreen: true,
      activeLeading: 'lang',
    );
  }
}

class ChekLanguage extends StatelessWidget {
  const ChekLanguage({
    Key? key,
    required this.lang,
    this.isActive = false,
  }) : super(key: key);

  final LanguageEnum lang;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (_) {
        context.read<LanguageProvider>().changeLanguage(lang);
      },
      title: Text(lang.title),
      value: isActive,
    );
  }
}
