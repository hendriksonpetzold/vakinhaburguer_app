import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/pages/auth/login/login_page.dart';
import 'package:vakinha_burguer_mobile/app/pages/auth/register/register_bindings.dart';
import 'package:vakinha_burguer_mobile/app/pages/auth/register/register_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      binding: RegisterBindings(),
      page: () => const RegisterPage(),
    ),
  ];
}
