part of '../registration_form.dart';

class ConformPasswordField extends StatelessWidget {
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
          key: const Key('registrationForm_ConformPasswordInput_textField'),
          onChanged: (String value) {
            context.read<RegistrationBloc>().add(
                  RegistrationConformPasswordChanged(conformPassword: value),
                );
          },
          validator: ValidationBuilder().confirm(state.password).build(),
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            hintText: 'Re-enter your password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: GestureDetector(
              onTap: () {
                context.read<RegistrationBloc>().add(
                      RegistrationPasswordObscureChanged(
                        obscure: !state.obscure,
                      ),
                    );
              },
              child: CustomSuffixIcon(svgIcon: 'assets/icons/lock.svg'),
            ),
          ),
        );
      },
    );
  }
}
