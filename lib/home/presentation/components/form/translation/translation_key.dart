part of 'translation.dart';

class TranslationKey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: getProportionateScreenWidth(30),
        maxHeight: getProportionateScreenWidth(140),
      ),
      child: BlocBuilder<TranslationBloc, TranslationState>(
        builder: (context, state) {
          return Stack(
            overflow: Overflow.visible,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: getProportionateScreenWidth(20),
                ),
                child: TextField(
                  style: kFormTextStyle,
                  maxLines: null,
                  decoration: InputDecoration.collapsed(
                    hintText: '',
                  ).copyWith(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  controller: TextEditingController.fromValue(
                    TextEditingValue(
                      text: state.key,
                      selection: TextSelection.collapsed(
                        offset: state.key.length,
                      ),
                    ),
                  ),
                  onChanged: (String value) {
                    context.read<TranslationBloc>()
                      ..add(TranslationKeyChanged(key: value))
                      ..add(TranslationSubmitted());
                  },
                ),
              ),
              if (state.status == TranslationStatus.success)
                Positioned(
                  top: -10,
                  right: -5,
                  child: GestureDetector(
                    onTap: () => context
                        .read<TranslationBloc>()
                        .add(TranslationResetted()),
                    child: Icon(
                      Icons.highlight_remove_outlined,
                      color: kPrimaryColor,
                      size: getProportionateScreenWidth(25),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
