part of 'languages.dart';

class SwitchLanguageButton extends StatelessWidget {
  final String keyLanguage;
  final String valueLanguage;

  const SwitchLanguageButton({
    Key key,
    @required this.keyLanguage,
    @required this.valueLanguage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.compare_arrows,
        color: kPrimaryColor,
      ),
      onPressed: () {
        context.read<TranslationBloc>().add(
              TranslationSwitchLanguage(
                keyLanguageLocale: valueLanguage,
                valueLanguageLocale: keyLanguage,
              ),
            );
      },
    );
  }
}
