import 'package:dotory_app/ui/global/color_data.dart';
import 'package:dotory_app/ui/view/login/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: DotoryApp()));
}

class DotoryApp extends StatelessWidget {
  const DotoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dotory',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorData.COLOR_WHITE
      ),
      home: const SplashView(),
    );
  }
}
