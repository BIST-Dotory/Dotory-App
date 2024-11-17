import 'dart:async';

import 'package:dotory_app/ui/view/login/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 2), () {
        _moveLoginScreen(context);
      });
    });

    return Scaffold(
        body: Center(
          child: Image.asset('assets/images/dotory_logo.png', width: 234, height: 94)),
        );
  }

  void _moveLoginScreen(BuildContext context) {
    Navigator.pop(context); //Splash 화면 제거
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const LoginView()));
  }

}