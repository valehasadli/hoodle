part of '../login_form.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SubmitButton({
    Key key,
    @required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return DefaultButton(
          key: const Key('loginForm_continue_submitButton'),
          text: 'Continue',
          ready: state.status == LoginStatus.dirty ||
              state.status == LoginStatus.progress,
          loading: state.status == LoginStatus.progress,
          press: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              context.read<LoginBloc>().add(LoginSubmitted());
            }
          },
        );
      },
    );
  }
}
