part of 'languages.dart';

class KeyLanguageButton extends StatelessWidget {
  final String language;
  final List<DropdownMenuItem> items;

  const KeyLanguageButton({
    Key key,
    @required this.language,
    @required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        iconSize: 0,
        style: kSearchBoxTitleTextStyle,
        value: language,
        items: items,
        onChanged: (value) {
          context
              .read<TranslationBloc>()
              .add(TranslationKeyLanguageChanged(language: value));
        },
      ),
    );
  }
}
