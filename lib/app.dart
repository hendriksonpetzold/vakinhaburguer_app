import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/bindings/application_bindings.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/routes/auth_routers.dart';

import 'package:vakinha_burguer_mobile/app/routes/splash_routers.dart';

class VakinhaBurguerApp extends StatelessWidget {
  const VakinhaBurguerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBindings(),
      title: 'Vakinha Burguer',
      theme: VakinhaUI.theme,
      getPages: [
        ...OnBoardingRouters.routers,
        ...AuthRouters.routers,
      ],
    );
  }
}
