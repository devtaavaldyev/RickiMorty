import 'package:flutter/material.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';

part 'app_colors.dart';

abstract class AppTheme {
  AppColors get colors;
  ThemeData get theme;
}

class DarkTheme implements AppTheme {
  @override
  AppColors get colors => DarkColors();

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: colors.lightFCFCFC,
        appBarTheme: AppBarTheme(
          color: colors.lightFCFCFC,
          titleTextStyle: AppTextStyles.w500size20.copyWith(
            color: colors.textColor0B1E2D,
          ),
        ),
      );
}

class LightTheme implements AppTheme {
  @override
  AppColors get colors => LightColors();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: colors.lightFCFCFC,
        appBarTheme: AppBarTheme(
          color: colors.lightFCFCFC,
          iconTheme: IconThemeData(color: colors.textColor0B1E2D),
          titleTextStyle: AppTextStyles.w500size20.copyWith(
            color: colors.textColor0B1E2D,
          ),
        ),
      );
}
