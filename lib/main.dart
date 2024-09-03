import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:try_ricki_2/config/l10n/generated/l10n.dart';
import 'package:try_ricki_2/config/language/language_provider.dart';
import 'package:try_ricki_2/config/theme/app_theme.dart';
import 'package:try_ricki_2/config/theme/theme_provider.dart';
import 'package:try_ricki_2/features/presentation/screens/splash_screen/splash_screen.dart';

import 'package:try_ricki_2/service_locator.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

final scaffoldmessanger = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider(create: (context) => ChekBoxesState()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          scaffoldMessengerKey: scaffoldmessanger,
          debugShowCheckedModeBanner: false,
          title: 'RickiMorty',
          theme: LightTheme().theme,
          darkTheme: DarkTheme().theme,
          themeMode: context.watch<ThemeProvider>().themeMode,
          home: const SplashScreen(),
          locale: context.watch<LanguageProvider>().currentLocale,
          supportedLocales: Language.delegate.supportedLocales,
          localizationsDelegates: const [
            Language.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
        );
      }),
    );
  }
}
