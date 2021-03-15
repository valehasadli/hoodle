import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';

import 'injections.dart' as injections;
import 'common/configs/theme.dart';
import 'common/routes/router.gr.dart';
import 'common/routes/guards/auth_guard.dart';
import 'common/routes/guards/guest_guard.dart';

bool useFirebaseEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injections.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'HOODLE',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder<AppRouter>(
        router: AppRouter(),
        guards: [
          GuestGuard(),
          AuthGuard(),
        ],
        initialRoute: Routes.splashScreen,
        builder: (ctx, extendedNav) => Theme(
          data: theme(),
          child: extendedNav,
        ),
      ),
      home: Text(''),
    );
  }
}
