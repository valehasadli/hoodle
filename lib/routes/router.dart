import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:hoodle/navigation/presentation/navigation_screen.dart';

import '../complete_profile/presentation/complete_profile_screen.dart';
import '../forgot_password/presentation/forgot_password_screen.dart';
import '../home/presentation/home_screen.dart';
import '../registration/presentation/registration_screen.dart';
import '../splash/presentation/splash_screen.dart';
import '../login/presentation/login_screen.dart';
import '../login_success/presentation/login_success_screen.dart';
import '../profile/presentation/profile_screen.dart';
import '../timeline/presentation/timeline_screen.dart';

import '../common/utils/constants.dart'
    show kRouteAnimationDuration, kRouteTransitionBuilder;

import 'guards/auth_guard.dart';
import 'guards/guest_guard.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    CustomRoute<bool>(
      page: SplashScreen,
      initial: true,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: LoginScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: CompleteProfileScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: RegistrationScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: ForgotPasswordScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [GuestGuard],
    ),
    CustomRoute<bool>(
      page: LoginSuccessScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [AuthGuard],
    ),
    CustomRoute<bool>(
      page: HomeScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [AuthGuard],
    ),
    CustomRoute<bool>(
      page: ProfileScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [AuthGuard],
    ),
    CustomRoute<bool>(
      page: TimelineScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [AuthGuard],
    ),
    CustomRoute<bool>(
      page: NavigationScreen,
      transitionsBuilder: kRouteTransitionBuilder,
      durationInMilliseconds: kRouteAnimationDuration,
      guards: [AuthGuard],
    ),
  ],
)
class $AppRouter {}
