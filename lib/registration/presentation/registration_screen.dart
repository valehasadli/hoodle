import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injections.dart';
import '../../common/config/custom_size.dart';
import '../../common/components/custom_app_bar.dart';
import 'bloc/registration_bloc.dart';

import 'components/body.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) => serviceLocator<RegistrationBloc>(),
        child: Body(),
      ),
    );
  }
}
