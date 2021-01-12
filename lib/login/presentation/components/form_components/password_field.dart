part of '../login_form.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.obscure != current.obscure,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_passwordInput_textField'),
          obscureText: state.obscure,
          onChanged: (String value) {
            context.read<LoginBloc>().add(
                  LoginPasswordChanged(password: value),
                );
          },
          validator: ValidationBuilder()
              .required(kPassNullError)
              .minLength(6, kShortPassError)
              .maxLength(191, kLongPassError)
              .password()
              .build(),
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: GestureDetector(
              onTap: () {
                context
                    .read<LoginBloc>()
                    .add(LoginPasswordObscureChanged(obscure: !state.obscure));
              },
              child: CustomSuffixIcon(svgIcon: 'assets/icons/lock.svg'),
            ),
          ),
        );
      },
    );
  }
}
