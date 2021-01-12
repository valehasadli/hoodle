part of '../login_form.dart';

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_emailInput_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (String value) {
            context.read<LoginBloc>().add(
                  LoginEmailChanged(email: value),
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
