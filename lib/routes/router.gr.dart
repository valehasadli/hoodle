// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../common/presentation/navigation_screen.dart';
import '../complete_profile/presentation/complete_profile_screen.dart';
import '../forgot_password/presentation/forgot_password_screen.dart';
import '../home/presentation/home_screen.dart';
import '../login/presentation/login_screen.dart';
import '../login_success/presentation/login_success_screen.dart';
import '../profile/presentation/profile_screen.dart';
import '../registration/presentation/registration_screen.dart';
import '../splash/presentation/splash_screen.dart';
import '../timeline/presentation/timeline_screen.dart';
import 'guards/auth_guard.dart';
import 'guards/guest_guard.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginScreen = '/login-screen';
  static const String completeProfileScreen = '/complete-profile-screen';
  static const String registrationScreen = '/registration-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String loginSuccessScreen = '/login-success-screen';
  static const String homeScreen = '/home-screen';
  static const String profileScreen = '/profile-screen';
  static const String timelineScreen = '/timeline-screen';
  static const String navigationScreen = '/navigation-screen';
  static const all = <String>{
    splashScreen,
    loginScreen,
    completeProfileScreen,
    registrationScreen,
    forgotPasswordScreen,
    loginSuccessScreen,
    homeScreen,
    profileScreen,
    timelineScreen,
    navigationScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen, guards: [GuestGuard]),
    RouteDef(Routes.loginScreen, page: LoginScreen, guards: [GuestGuard]),
    RouteDef(Routes.completeProfileScreen,
        page: CompleteProfileScreen, guards: [GuestGuard]),
    RouteDef(Routes.registrationScreen,
        page: RegistrationScreen, guards: [GuestGuard]),
    RouteDef(Routes.forgotPasswordScreen,
        page: ForgotPasswordScreen, guards: [GuestGuard]),
    RouteDef(Routes.loginSuccessScreen,
        page: LoginSuccessScreen, guards: [AuthGuard]),
    RouteDef(Routes.homeScreen, page: HomeScreen, guards: [AuthGuard]),
    RouteDef(Routes.profileScreen, page: ProfileScreen, guards: [AuthGuard]),
    RouteDef(Routes.timelineScreen, page: TimelineScreen, guards: [AuthGuard]),
    RouteDef(Routes.navigationScreen,
        page: NavigationScreen, guards: [AuthGuard]),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => SplashScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    LoginScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    CompleteProfileScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CompleteProfileScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    RegistrationScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegistrationScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    ForgotPasswordScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ForgotPasswordScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    LoginSuccessScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LoginSuccessScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    HomeScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    ProfileScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProfileScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    TimelineScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TimelineScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
    NavigationScreen: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            NavigationScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension AppRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<bool> pushSplashScreen() => push<bool>(Routes.splashScreen);

  Future<bool> pushLoginScreen() => push<bool>(Routes.loginScreen);

  Future<bool> pushCompleteProfileScreen() =>
      push<bool>(Routes.completeProfileScreen);

  Future<bool> pushRegistrationScreen() =>
      push<bool>(Routes.registrationScreen);

  Future<bool> pushForgotPasswordScreen() =>
      push<bool>(Routes.forgotPasswordScreen);

  Future<bool> pushLoginSuccessScreen() =>
      push<bool>(Routes.loginSuccessScreen);

  Future<bool> pushHomeScreen() => push<bool>(Routes.homeScreen);

  Future<bool> pushProfileScreen() => push<bool>(Routes.profileScreen);

  Future<bool> pushTimelineScreen() => push<bool>(Routes.timelineScreen);

  Future<bool> pushNavigationScreen() => push<bool>(Routes.navigationScreen);
}
