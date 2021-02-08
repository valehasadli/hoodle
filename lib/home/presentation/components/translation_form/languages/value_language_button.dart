part of 'languages.dart';

class ValueLanguageButton extends StatelessWidget {
  final String language;
  final List<DropdownMenuItem> items;

  const ValueLanguageButton({
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
              .add(TranslationValueLanguageChanged(language: value));
        },
      ),
    );
  }
}
