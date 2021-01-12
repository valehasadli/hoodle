part of '../registration_form.dart';

class NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          key: const Key('registrationForm_NameInput_textField'),
          onChanged: (String value) {
            context.read<RegistrationBloc>().add(
                  RegistrationNameChanged(name: value),
                );
          },
          validator: ValidationBuilder()
              .required(kNameNullError)
              .minLength(2, kShortNameError)
              .maxLength(50, kLongNameError)
              .build(),
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: 'Enter your name',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/user.svg'),
          ),
        );
      },
    );
  }
}
