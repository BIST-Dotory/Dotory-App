import 'package:dotory_app/data/viewmodel/login_viewmodel.dart';
import 'package:dotory_app/ui/global/color_data.dart';
import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:dotory_app/ui/global/device_size.dart';
import 'package:dotory_app/ui/view/login/register_view.dart';
import 'package:dotory_app/ui/view/main/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFieldState {
  final String id;
  final String password;

  TextFieldState({this.id = '', this.password = ''});

  TextFieldState copyWith({String? id, String? password}) {
    return TextFieldState(
        id: id ?? this.id,
        password: password ?? this.password
    );
  }
}

class TextFieldNotifier extends StateNotifier<TextFieldState> {
  TextFieldNotifier() : super(TextFieldState());

  void updateIdText(String text) {
    state = state.copyWith(id: text);
  }

  void updatePwText(String text) {
    state = state.copyWith(password: text);
  }
}
final textFieldProvider =
  StateNotifierProvider<TextFieldNotifier, TextFieldState>((ref) => TextFieldNotifier());


class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final textFieldState = ref.watch(textFieldProvider);

    void onIdChanged(String text) {
      ref.read(textFieldProvider.notifier).updateIdText(text);
    }
    void onPwChanged(String text) {
      ref.read(textFieldProvider.notifier).updatePwText(text);
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 0, bottom: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/dotory_text_logo.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ),
                      hintText: '학번',
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                      )
                    ),
                    onChanged: onIdChanged,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    obscureText: true, //password 입력 효과
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        hintText: '비밀번호',
                        hintStyle: TextStyle(
                            color: Colors.grey
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                        )
                    ),
                    onChanged: onPwChanged,
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  SizedBox(
                      width: DeviceSize.getWidth(context),
                      height: 50,
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        color: ColorData.FOCUS_COLOR,
                        child: const Text('로그인'),
                        onPressed: () {
                          _checkLogin(context);
                          print('학번 : ${textFieldState.id} / 비밀번호 : ${textFieldState.password}');
                      }
                    )
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: DeviceSize.getWidth(context),
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: const Text(
                                '회원가입',
                              style: TextStyle(
                                color: ColorData.FOCUS_COLOR
                              ),
                            ),
                          onPressed: (){
                              _moveRegisScreen(context);
                          },
                        ),
                        CupertinoButton(
                            padding: const EdgeInsets.all(0),
                            child: const Text(
                              '학번/비밀번호 찾기',
                              style: TextStyle(
                                  color: ColorData.FOCUS_COLOR
                              ),
                            ),
                            onPressed: () => {})
                      ],
                    ),
                  )
                ],
              )
          ),
      )
    );
  }

  void _moveRegisScreen(BuildContext context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => const RegisterView()));
    }

  /// 유저 검증
  void _checkLogin(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => MainView()));
  }
}