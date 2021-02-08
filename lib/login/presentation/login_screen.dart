import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injections.dart';
import '../../common/config/responsive.dart';
import '../../common/presentation/components/guest_app_bar.dart';
import '../../common/presentation/connection_sensitive_screen.dart';

import 'bloc/login_bloc.dart';
import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return ConnectionSensitiveScreen(
      child: Scaffold(
        appBar: GuestAppBar(),
        body: BlocProvider<LoginBloc>(
          create: (context) => serviceLocator<LoginBloc>(),
          child: Body(),
        ),
      ),
    );
  }
}
