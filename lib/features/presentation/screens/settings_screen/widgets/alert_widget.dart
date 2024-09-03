part of '../settings_screen.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indexLang = ValueNotifier<int>(1);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: context.colors.lightFCFCFC,
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        Language.of(context).darkTheme,
        style: AppTextStyles.w500size20.copyWith(
          color: context.colors.textColor0B1E2D,
        ),
      ),
      content: ValueListenableBuilder(
        valueListenable: indexLang,
        builder: (context, _, __) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  Language.of(context).off,
                  style: AppTextStyles.w400size16,
                ),
                leading: Radio<int>(
                  value: 0,
                  groupValue: indexLang.value,
                  onChanged: (val) {
                    indexLang.value = val!;
                    // TODO ПереРаботать!
                    // context
                    //     .read<ThemeProvider>()
                    //     .changeTheme(ThemeModes.light);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  Language.of(context).enabled,
                  style: AppTextStyles.w400size16,
                ),
                leading: Radio<int>(
                  value: 1,
                  groupValue: indexLang.value,
                  onChanged: (val) {
                    indexLang.value = val!;
                    // context
                    //     .read<ThemeProvider>()
                    //     .changeTheme(ThemeModes.dark);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  Language.of(context).followSystemSettings,
                  style: AppTextStyles.w400size16,
                ),
                leading: Radio<int>(
                  value: 2,
                  groupValue: indexLang.value,
                  onChanged: (val) {
                    indexLang.value = val!;
                    context.read<ThemeProvider>().changeTheme(ThemeModes.light);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  Language.of(context).inPowerSavingMode,
                  style: AppTextStyles.w400size16,
                ),
                leading: Radio<int>(
                  value: 3,
                  groupValue: indexLang.value,
                  onChanged: (val) {
                    indexLang.value = val!;
                    context.read<ThemeProvider>().changeTheme(ThemeModes.dark);
                  },
                ),
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Ok',
            style: AppTextStyles.w500size14.copyWith(
              color: context.colors.textColor0B1E2D,
            ),
          ),
        ),
      ],
    );
  }
}
