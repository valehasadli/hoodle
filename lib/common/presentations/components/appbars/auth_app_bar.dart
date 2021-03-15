import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../configs/responsive.dart';
import '../../../utils/theme_constants.dart';
import '../../../../injections.dart';
import '../../../routes/router.gr.dart';
import '../../blocs/auth/auth_bloc.dart';

class AuthAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => serviceLocator<AuthBloc>(),
      child: SliverAppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Text('Hoodle'),
            SizedBox(width: getProportionateScreenWidth(5)),
            Text(
              'Translation',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.progress) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: const Text('Redirecting...'),
                    ),
                  );
              } else if (state.status == AuthStatus.success) {
                Future.delayed(const Duration(seconds: 2), () {
                  ExtendedNavigator.of(context).push(
                    Routes.splashScreen,
                  );
                });
              } else if (state.status == AuthStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: const Text('Something went wrong...'),
                    ),
                  );
              }
            },
            builder: (context, state) {
              return IconButton(
                icon: Icon(MdiIcons.logout),
                onPressed: state.status == AuthStatus.pure
                    ? () => context.read<AuthBloc>().add(AuthLogout())
                    : null,
                color: Colors.white,
              );
            },
          )
        ],
      ),
    );
  }
}
