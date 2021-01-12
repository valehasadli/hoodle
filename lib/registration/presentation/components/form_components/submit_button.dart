part of '../registration_form.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SubmitButton({
    Key key,
    @required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return DefaultButton(
          key: const Key('registrationForm_continue_submitButton'),
          text: 'Continue',
          ready: state.status == RegistrationStatus.dirty ||
              state.status == RegistrationStatus.progress,
          loading: state.status == RegistrationStatus.progress,
          press: () {
            if (formKey.currentState.validate()) {
              formKey.currentState.save();
              context.read<RegistrationBloc>().add(RegistrationSubmitted());
            }
          },
        );
      },
    );
  }
}
