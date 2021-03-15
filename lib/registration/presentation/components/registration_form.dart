import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:auto_route/auto_route.dart';

import '../../../common/utils/error_constants.dart';
import '../../../common/configs/responsive.dart';
import '../../../common/presentations/components/custom_suffix_icon.dart';
import '../../../common/presentations/components/default_button.dart';
import '../../../common/helpers/password_validator.dart';
import '../../../common/helpers/email_validator.dart';
import '../../../common/helpers/confirm_password_validator.dart';

import '../../../common/routes/router.gr.dart';
import '../bloc/registration_bloc.dart';

part 'form_components/email_field.dart';
part 'form_components/name_field.dart';
part 'form_components/password_field.dart';
part 'form_components/conform_password_field.dart';
part 'form_components/submit_button.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state.status == RegistrationStatus.success) {
          context.navigator.pushAndRemoveUntil(
            Routes.navigationScreen,
            (route) => false,
          );
        }
        if (state.status == RegistrationStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: const Text('Registration Failure'),
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
          NameField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          PasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          ConformPasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          SubmitButton(formKey: _formKey),
        ],
      ),
    );
  }
}
