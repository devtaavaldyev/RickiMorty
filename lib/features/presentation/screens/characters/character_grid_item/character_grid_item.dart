part of '../character_screen.dart';

// ignore: must_be_immutable
class CharacterGridItem extends StatelessWidget {
  CharacterGridItem({super.key, required this.characters});
  List<CharactersModel>? characters = [];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const PageStorageKey('1'),
      itemCount: characters!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.88,
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 7,
      ),
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1.5,
                blurRadius: 1.5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: characters?[index].image ?? '',
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 60,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.w500size14.copyWith(
                      color: context.colors.textColor0B1E2D,
                    ),
                  ),
                  Text(
                    characters?[index].gender ?? '',
                    style: AppTextStyles.w400size12
                        .copyWith(color: context.colors.textColor828282),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
