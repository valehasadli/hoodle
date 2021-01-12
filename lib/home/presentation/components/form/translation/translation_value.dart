part of 'translation.dart';

class TranslationValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: getProportionateScreenWidth(30),
        maxHeight: getProportionateScreenWidth(140),
      ),
      child: BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, state) {
          return TextField(
            readOnly: true,
            controller: TextEditingController.fromValue(
              TextEditingValue(text: state.value),
            ),
            maxLines: null,
            style: kFormTextStyle,
            decoration: InputDecoration.collapsed(
              hintText: '',
            ).copyWith(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          );
        },
      ),
    );
  }
}
