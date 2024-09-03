import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_ricki_2/config/l10n/generated/l10n.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';
import 'package:try_ricki_2/core/resources/app_images.dart';
import 'package:try_ricki_2/service_locator.dart';
import 'package:try_ricki_2/utils/extentions/extension.dart';
import 'package:try_ricki_2/features/data/models/characters_model.dart';
import 'package:try_ricki_2/features/presentation/bloc/characters/characters_bloc.dart';
import 'package:try_ricki_2/features/presentation/screens/characters/character_detail_screen/character_detail_screen.dart';
import 'package:try_ricki_2/features/presentation/screens/filters_screen/filter_screen.dart';

import 'package:try_ricki_2/features/presentation/widgets/app_text_field.dart';
part 'character_grid_item/character_grid_item.dart';
part 'character_list_item/character_list_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _CharacterScreenState extends State<CharacterScreen> {
  final isGrid = ValueNotifier<bool>(true);
  String names = '';
  String? stat;

  final _bloc = sl<CharactersBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: context.colors.lightFCFCFC,
      body: Padding(
        padding: const EdgeInsets.only(top: 38, left: 16, right: 16, bottom: 0),
        child: BlocProvider(
          create: (context) =>
              _bloc..add(const CharacterEvents.getCharacters()),
          child: Column(
            children: [
              AppTextField(
                hintText: Language.of(context).searchCharacter,
                onChanged: (name) {
                  name = names;
                },
                onPressed: () {
                  log(names);
                  _bloc.add(
                      CharacterEvents.searchCharacters(names, stat ?? '', ''));
                },
                onTap: () async {
                  stat = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterScreen(bf: stat ?? ''),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),
              BlocBuilder<CharactersBloc, CharacterStates>(
                builder: (context, state) {
                  return state.when(
                    initial: (characters) => const Center(
                        child: Text('Initial State, Pleace await 1 minute')),
                    loading: (characters) => const Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(),
                    ),
                    error: (error) => SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 60),
                          Image.asset(
                            AppImages.notFound,
                            scale: 4,
                          ),
                          Text(
                            error,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.w400size16.copyWith(
                              color: context.colors.textColor828282,
                            ),
                          ),
                        ],
                      ),
                    ),
                    succes: (characters) => Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 36,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${Language.of(context).allCharacters} ${characters.length}'
                                      .toUpperCase(),
                                  style: AppTextStyles.w500size10.copyWith(
                                    color: context.colors.textColor828282,
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: isGrid,
                                  builder: (context, _, __) {
                                    return IconButton(
                                      onPressed: () {
                                        isGrid.value = !isGrid.value;
                                      },
                                      icon: isGrid.value
                                          ? Icon(
                                              Icons.grid_view_outlined,
                                              color: context.colors.dark0B1E2D,
                                            )
                                          : Icon(
                                              Icons.format_list_bulleted,
                                              color: context.colors.dark0B1E2D,
                                            ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable: isGrid,
                            builder: (context, _, __) {
                              return NotificationListener(
                                onNotification:
                                    (ScrollNotification notification) {
                                  if (notification.metrics.pixels + 100 >=
                                      notification.metrics.maxScrollExtent) {
                                    if (names.isEmpty) {
                                      _bloc.add(const CharacterEvents
                                          .getCharacters());
                                    }
                                  }
                                  return false;
                                },
                                child: Expanded(
                                  child: isGrid.value
                                      ? CharacterGridItem(
                                          characters: characters,
                                        )
                                      : CharacterListItem(
                                          characters: characters),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// List result=[ ]; search(String keyword){ result = await ApiService.search(keyword): result.sort ((a, b)=> a.name.compareTo(b.name)); update;
