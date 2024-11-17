import 'package:dotory_app/data/viewmodel/login_viewmodel.dart';
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
          child: Column(
            children:[
              CupertinoTextField(
                placeholder: '학번',
                onChanged: onIdChanged,
              ),
              CupertinoTextField(
                obscureText: true, //password 입력 효과
                placeholder: '비밀번호',
                onChanged: onPwChanged,
              ),
              CupertinoButton(child: const Text('로그인'), onPressed: () => {
                print('학번 : ${textFieldState.id} / 비밀번호 : ${textFieldState.password}')
              })
            ],
          ),
      )
    );
  }
}