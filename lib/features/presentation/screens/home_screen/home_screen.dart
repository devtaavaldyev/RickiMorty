import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:try_ricki_2/config/l10n/generated/l10n.dart';
import 'package:try_ricki_2/core/resources/app_svgs.dart';

import 'package:try_ricki_2/features/presentation/screens/characters/character_screen.dart';
import 'package:try_ricki_2/features/presentation/screens/characters/character_detail_screen/character_detail_screen.dart';

import 'package:try_ricki_2/features/presentation/screens/settings_screen/settings_screen.dart';
import 'package:try_ricki_2/utils/extentions/extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          const CharacterScreen(),
          CharacterDetailScreen(id: 1),
          Scaffold(
            appBar: AppBar(
              title: const Text('ChangeTheme'),
            ),
          ),
          const SettingsScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 12,
        backgroundColor: context.colors.colorFFFFFF,
        selectedItemColor: context.colors.navBarSelect,
        selectedFontSize: 14,
        unselectedItemColor: context.colors.unSelectedBDBDBD,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        //TODO Remove setState()
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.character,
              color: context.colors.unSelectedBDBDBD,
            ),
            activeIcon: SvgPicture.asset(
              AppSvgs.character,
              color: context.colors.navBarSelect,
            ),
            label: Language.of(context).characters,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.location,
            ),
            activeIcon: SvgPicture.asset(
              AppSvgs.location,
              color: context.colors.navBarSelect,
            ),
            label: Language.of(context).location,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.episodes,
            ),
            activeIcon: SvgPicture.asset(
              AppSvgs.episodes,
              color: context.colors.navBarSelect,
            ),
            label: Language.of(context).episodes,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: Language.of(context).settings,
          ),
        ],
      ),
    );
  }
}
