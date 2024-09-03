import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_ricki_2/config/l10n/generated/l10n.dart';
import 'package:try_ricki_2/config/theme/app_text_styles.dart';

import 'package:try_ricki_2/utils/extentions/extension.dart';
import 'package:try_ricki_2/features/data/models/characters_model.dart';
import 'package:try_ricki_2/features/presentation/bloc/characters/characters_bloc.dart';
import 'package:try_ricki_2/features/presentation/screens/characters/character_screen.dart';
import 'package:try_ricki_2/core/resources/app_images.dart';
import 'package:try_ricki_2/features/presentation/widgets/app_list_tile.dart';

import 'package:try_ricki_2/service_locator.dart';


part 'widgets/my_sliver_app_bar.dart';

// ignore: must_be_immutable
class CharacterDetailScreen extends StatelessWidget {
  CharacterDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  int id;
  final _bloc = sl<CharactersBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc..add(CharacterEvents.detailCharacters(id)),
      child: Scaffold(
        backgroundColor: context.colors.lightFCFCFC,
        body: BlocBuilder<CharactersBloc, CharacterStates>(
          bloc: _bloc,
          builder: (context, state) {
            return state.maybeWhen(
              loading: (characters) => const Center(
                child: CircularProgressIndicator(),
              ),
              orElse: () => const Center(
                child: Text('State OrElse await two minutes'),
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
              succes: (characters) => CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: MySliverAppBar(
                        expandedHeight: 200, characters: characters.first),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 90,
                          ),
                          Text(
                            characters.last.name ?? 'PROTOTTT',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.w400size34.copyWith(
                                color: context.colors.textColor0B1E2D),
                          ),
                          Text(
                            characters.first.status ?? 'PROTOTTT',
                            style: AppTextStyles.w500size14.copyWith(
                              color: characters.first.status == 'Alive'
                                  ? context.colors.textColor43D049
                                  : characters.first.status == 'Dead'
                                      ? context.colors.textColorEB5757
                                      : context.colors.unSelectedBDBDBD,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудностьи социопатия заставляют беспокоиться семью его дочери.",
                            style: AppTextStyles.w400size13.copyWith(
                              color: context.colors.textColor0B1E2D,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Language.of(context).gender,
                                    style: AppTextStyles.w400size12.copyWith(
                                      color: context.colors.textColor828282,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    characters.first.gender ?? 'PROTOTTT',
                                    style: AppTextStyles.w400size14.copyWith(
                                      color: context.colors.textColor0B1E2D,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Column(
                                children: [
                                  Text(
                                    Language.of(context).race,
                                    style: AppTextStyles.w400size12.copyWith(
                                      color: context.colors.textColor828282,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    characters.first.species ?? 'PROTOTTT',
                                    style: AppTextStyles.w400size14.copyWith(
                                      color: context.colors.textColor0B1E2D,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          AppListTile(
                            title: Language.of(context).placeOfBirth,
                            subtitle: characters.first.origin?.name ?? 'blabla',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CharacterScreen(),
                                ),
                              );
                            },
                            isSettingsScreen: false,
                          ),
                          const SizedBox(height: 6),
                          AppListTile(
                            title: Language.of(context).location,
                            subtitle:
                                characters.first.location?.name ?? 'PROTOTTT',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CharacterScreen(),
                                ),
                              );
                            },
                            isSettingsScreen: false,
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Language.of(context).episodes,
                                style: AppTextStyles.w500size20.copyWith(
                                  color: context.colors.textColor0B1E2D,
                                ),
                              ),
                              Text(
                                'Все ${Language.of(context).episodes}',
                                style: AppTextStyles.w400size12.copyWith(
                                  color: context.colors.textColor828282,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 250,
                              child: CharacterListItem(
                                characters: characters,
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
