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
        // Ripple 효과 비활성화
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: ColorData.COLOR_WHITE, //scaffold background color
          primaryColor: ColorData.MAIN_COLOR,
          textSelectionTheme: const TextSelectionThemeData(
          cursorColor: ColorData.FOCUS_COLOR, //textfield cursor color
          selectionHandleColor: ColorData.FOCUS_COLOR, // textfield handle color
          selectionColor: ColorData.FOCUS_COLOR // textfield selection color
        )
      ),
      home: const SplashView(),
    );
  }
}
