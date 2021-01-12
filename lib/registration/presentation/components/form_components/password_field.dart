part of '../registration_form.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.obscure != current.obscure ||
          previous.password != current.password ||
          previous.conformPassword != current.conformPassword,
      builder: (context, state) {
        return TextFormField(
          obscureText: state.obscure,
          key: const Key('registrationForm_PasswordInput_textField'),
          onChanged: (String value) {
            context.read<RegistrationBloc>().add(
                  RegistrationPasswordChanged(password: value),
                );
          },
          validator: ValidationBuilder()
              .required(kPassNullError)
              .minLength(6, kShortPassError)
              .maxLength(191, kLongPassError)
              .password()
              .build(),
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: GestureDetector(
              onTap: () {
                context.read<RegistrationBloc>().add(
                      RegistrationPasswordObscureChanged(
                        obscure: !state.obscure,
                      ),
                    );
              },
              child: CustomSuffixIcon(svgIcon: "assets/icons/lock.svg"),
            ),
          ),
        );
      },
    );
  }
}
