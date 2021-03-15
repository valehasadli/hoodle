import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';

import '../../../common/utils/error_constants.dart';
import '../../../common/utils/theme_constants.dart';
import '../../../common/configs/responsive.dart';
import '../../../common/presentations/components/default_button.dart';
import '../../../common/presentations/components/custom_suffix_icon.dart';
import '../../../common/helpers/email_validator.dart';
import '../../../common/helpers/password_validator.dart';

import '../bloc/login_bloc.dart';
import '../../../common/routes/router.gr.dart';

import 'forgot_password.dart';

part 'form_components/password_field.dart';
part 'form_components/email_field.dart';
part 'form_components/submit_button.dart';
part 'form_components/remember_me.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          context.navigator.pushAndRemoveUntil(
            Routes.loginSuccessScreen,
            (route) => false,
          );
        }

        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: const Text('Credentials is not correct!'),
              ),
            );
        }
      },
      child: buildForm(),
    );
  }

  Form buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          EmailField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          PasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              RememberMe(),
              Spacer(),
              ForgotPassword(),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          SubmitButton(formKey: _formKey),
        ],
      ),
    );
  }
}
