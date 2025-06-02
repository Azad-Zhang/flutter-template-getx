import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../modules/auth/login/bindings/auth_login_binding.dart';
import '../modules/auth/login/views/auth_login_view.dart';
import '../modules/auth/register/bindings/auth_register_binding.dart';
import '../modules/auth/register/views/auth_register_view.dart';
import '../modules/error/views/error_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH_LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const ErrorView(),
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () =>  AuthLoginView(),
          binding: AuthLoginBinding(),
        ),
        GetPage(
          name: _Paths.REGISTER,
          page: () =>  AuthRegisterView(),
          binding: AuthRegisterBinding(),
        ),
      ],
    ),
  ];
}
