part of '../character_screen.dart';

// ignore: must_be_immutable
class CharacterListItem extends StatelessWidget {
  CharacterListItem({super.key, required this.characters});
  List<CharactersModel>? characters = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const PageStorageKey('1'),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CharacterDetailScreen(id: characters![index].id ?? 1),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1.5,
                blurRadius: 1.5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: characters?[index].image ?? '',
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 38,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
              const SizedBox(width: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    characters?[index].status ?? '',
                    style: AppTextStyles.w500size10.copyWith(
                      color: characters?[index].status == 'Alive'
                          ? context.colors.textColor43D049
                          : characters?[index].status == 'Dead'
                              ? context.colors.textColorEB5757
                              : context.colors.unSelectedBDBDBD,
                    ),
                  ),
                  Text(
                    characters?[index].name ?? '',
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.w500size14.copyWith(
                      color: context.colors.textColor0B1E2D,
                    ),
                  ),
                  Text(
                    characters?[index].gender ?? '',
                    style: AppTextStyles.w400size12.copyWith(
                      color: context.colors.textColor828282,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemCount: characters!.length,
    );
  }
}
