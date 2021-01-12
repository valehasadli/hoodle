import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../complete_profile/presentation/complete_profile_screen.dart';
import '../forgot_password/presentation/forgot_password_screen.dart';
import '../home/presentation/home_screen.dart';
import '../registration/presentation/registration_screen.dart';
import '../splash/presentation/splash_screen.dart';
import '../login/presentation/login_screen.dart';
import '../login_success/presentation/login_success_screen.dart';

import '../common/utils/constants.dart';

import 'guards/auth_guard.dart';
import 'guards/guest_guard.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    CustomRoute<bool>(
      page: SplashScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: LoginSuccessScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [AuthGuard],
    ),
    CustomRoute<bool>(
      page: HomeScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [AuthGuard],
    ),
    CustomRoute<bool>(
      page: RegistrationScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: ForgotPasswordScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: CompleteProfileScreen,
      transitionsBuilder: TransitionsBuilders.zoomIn,
      durationInMilliseconds: routeDurationInMilliseconds,
      guards: [GuestGuard],
    ),
  ],
)
class $AppRouter {}
