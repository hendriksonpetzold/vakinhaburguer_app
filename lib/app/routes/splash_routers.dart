import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burguer_mobile/app/pages/onboarding/onboarding_page.dart';

class OnBoardingRouters {
  OnBoardingRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      page: () => const OnBoardingPage(),
    ),
  ];
}
