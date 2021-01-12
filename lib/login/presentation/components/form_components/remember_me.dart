part of '../login_form.dart';

class RememberMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              previous.rememberMe != current.rememberMe,
          builder: (context, state) {
            return Checkbox(
              key: const Key('loginForm_rememberMeInput_CheckBox'),
              activeColor: kPrimaryColor,
              value: state.rememberMe,
              onChanged: (bool value) {
                context
                    .read<LoginBloc>()
                    .add(LoginRememberMeChanged(rememberMe: value));
              },
            );
          },
        ),
      ],
    );
  }
}
