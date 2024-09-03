import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:try_ricki_2/config/theme/app_theme.dart';
import 'package:try_ricki_2/config/theme/theme_provider.dart';


extension ExtentionOnContext on BuildContext {
  AppColors get colors => Provider.of<ThemeProvider>(this).colors;
}

extension AppSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
