import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'injections.dart' as di;
import 'common/config/theme.dart';
import 'routes/router.gr.dart';
import 'routes/guards/auth_guard.dart';
import 'routes/guards/guest_guard.dart';

bool useFirebaseEmulator = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  await Firebase.initializeApp();
  if (useFirebaseEmulator) {
    FirebaseFirestore.instance.settings = Settings(
      host: 'localhost:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
  }
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
    );
  }
}
