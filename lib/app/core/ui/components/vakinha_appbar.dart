import 'package:flutter/material.dart';

class VakinhaAppbar extends AppBar {
  VakinhaAppbar({
    Key? key,
    double eleveation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          elevation: eleveation,
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.jpg',
            width: 80,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        );
}
