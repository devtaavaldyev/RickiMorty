part of '../settings_screen.dart';
// part 'widgets/edit_text_field.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.lightFCFCFC,
      appBar: AppBar(
        title: Text(
          Language.of(context).changeFullName,
          style: AppTextStyles.w500size20.copyWith(
            color: context.colors.textColor0B1E2D,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(right: 16, left: 16),
        children: [
          const SizedBox(height: 35),
          Text(
            Language.of(context).name,
            style: AppTextStyles.w400size14.copyWith(
              color: context.colors.textColor828282,
            ),
          ),
          const SizedBox(height: 14),
          EditTextField(
            hintText: Language.of(context).name,
          ),
          const SizedBox(height: 20),
          Text(
            Language.of(context).surname,
            style: AppTextStyles.w400size14.copyWith(
              color: context.colors.textColor828282,
            ),
          ),
          const SizedBox(height: 14),
          EditTextField(
            hintText: Language.of(context).surname,
          ),
          const SizedBox(height: 20),
          Text(
            Language.of(context).patronymic,
            style: AppTextStyles.w400size14.copyWith(
              color: context.colors.textColor828282,
            ),
          ),
          const SizedBox(height: 14),
          EditTextField(
            hintText: Language.of(context).patronymic,
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.buttonColors,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(Language.of(context).save),
            ),
          ),
        ],
      ),
    );
  }
}
