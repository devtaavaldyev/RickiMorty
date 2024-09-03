// ignore_for_file: public_member_api_docs, sort_constructors
part of '../character_detail_screen.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  const MySliverAppBar({
    required this.characters,
    required this.expandedHeight,
  });
  final CharactersModel characters;
  final double expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppBar(
          elevation: 3,
          automaticallyImplyLeading: false,
          title: ListTile(
            contentPadding: const EdgeInsets.only(left: 32),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(characters.image ?? ''),
            ),
            title: Text(characters.name ?? ''),
          ),
        ),
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Container(
            height: 218,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  characters.image ?? 'PROTOTTT',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: 1 - shrinkOffset / expandedHeight,
            child: SizedBox(
              height: expandedHeight,
              width: MediaQuery.of(context).size.width / 2,
              child: CircleAvatar(
                backgroundColor: context.colors.lightFCFCFC,
                radius: 77,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(
                    characters.image ?? 'PROTOTTT',
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
