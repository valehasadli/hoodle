part of 'translation.dart';

class TranslationDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslationBloc, TranslationState>(
      builder: (context, state) {
        if (state.status == TranslationStatus.progress ||
            state.status == TranslationStatus.success ||
            state.status == TranslationStatus.dirty) {
          return Divider();
        }
        return SizedBox();
      },
    );
  }
}
