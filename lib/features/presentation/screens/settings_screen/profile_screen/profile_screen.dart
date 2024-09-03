part of '../settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

File? imageGallery;

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? photoCallery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.lightFCFCFC,
      appBar: AppBar(
        title: Text(
          Language.of(context).editProfile,
          style: AppTextStyles.w500size20.copyWith(
            color: context.colors.textColor0B1E2D,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              ///  TODO save Photo(imageGallery) to SharedPreferences
              foregroundImage:
                  imageGallery != null ? FileImage(imageGallery!) : null,
              backgroundImage:
                  const NetworkImage('http://zornet.ru/_fr/19/0382514.png'),
              maxRadius: 75,
            ),
            const SizedBox(height: 18),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: context.colors.lightFCFCFC,
                      title: const Text('Выберите механизм'),
                      insetPadding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 25),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            Language.of(context).cancel,
                            style: AppTextStyles.w500size14.copyWith(
                                color: context.colors.textColor0B1E2D),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Ok',
                            style: AppTextStyles.w500size14.copyWith(
                                color: context.colors.textColor0B1E2D),
                          ),
                        ),
                      ],
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () async {
                              photoCallery = await _imagePicker.pickImage(
                                  source: ImageSource.camera);
                              imageGallery = File(photoCallery?.path ?? '');
                              setState(() {});
                            },
                            icon: const Icon(Icons.camera_alt_outlined),
                            label: Text(
                              'Camera',
                              style: AppTextStyles.w500size16.copyWith(
                                  color: context.colors.textColor0B1E2D),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () async {
                              photoCallery = await _imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              imageGallery = File(photoCallery?.path ?? '');
                              setState(() {});
                            },
                            icon: const Icon(Icons.image),
                            label: Text(
                              'Gallery',
                              style: AppTextStyles.w500size16.copyWith(
                                  color: context.colors.textColor0B1E2D),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text(
                Language.of(context).editPhoto,
                style: AppTextStyles.w400size16.copyWith(
                  color: context.colors.buttonColors,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Language.of(context).profile,
                  style: AppTextStyles.w500size10.copyWith(
                    color: context.colors.textColor828282,
                  ),
                ),
                const SizedBox(height: 12),
                AppListTile(
                  title: Language.of(context).changeFullName,
                  subtitle: 'Oleg Belotserkovsky',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditScreen(),
                      ),
                    );
                  },
                  isSettingsScreen: true,
                ),
                const SizedBox(height: 12),
                AppListTile(
                  title: Language.of(context).login,
                  subtitle: 'Rick',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditScreen(),
                      ),
                    );
                  },
                  isSettingsScreen: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
