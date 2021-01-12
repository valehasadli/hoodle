part of '../registration_form.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('registrationForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            context.read<RegistrationBloc>().add(
                  RegistrationEmailChanged(email: value),
                );
          },
          validator: ValidationBuilder()
              .required(kEmailNullError)
              .maxLength(191, kLongEmailError)
              .cEmail()
              .build(),
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/mail.svg'),
          ),
        );
      },
    );
  }
}
