import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_project_bloc_firebase/data/services/auth_service.dart';
import 'package:live_project_bloc_firebase/ui/screens/welcome/welcome_screen.dart';

import '../../ui/home_screen.dart';
import '../../ui/screens/authentication/login/login_screen.dart';
import '../../ui/screens/authentication/sign_up/signup_screen.dart';
import '../../ui/wrapper.dart';

part 'routes.dart';

class RoutePages {
  static final authService = AuthService();
  static final ROUTER = GoRouter(
    // redirect: (context, state) {
    //   if (authService.checkLoginStatus()) {
    //     if (state.fullPath == Routes.LOGIN_ROUTE ||
    //         state.fullPath == Routes.REGISTER_ROUTE ||
    //         state.fullPath == Routes.WELCOME_ROUTE) {
    //       return Routes.HOME;
    //     } else {
    //       return state.fullPath;
    //     }
    //   } else {
    //     return Routes.WELCOME_ROUTE;
    //   }
    // },
    routes: [
      GoRoute(
          path: Routes.WELCOME_ROUTE,
          name: Routes.WELCOME_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: WelcomeScreen())),
      GoRoute(
          path: Routes.LOGIN_ROUTE,
          name: Routes.LOGIN_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: LoginScreen())),
      GoRoute(
          path: Routes.REGISTER_ROUTE,
          name: Routes.REGISTER_ROUTE,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SignupScreen())),
      ShellRoute(
        builder: (context, state, child) => Wrapper(child: child),
        routes: [
          GoRoute(
              path: Routes.HOME,
              name: Routes.HOME,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: HomeScreen()))
        ],
      ),
    ],
  );
}
