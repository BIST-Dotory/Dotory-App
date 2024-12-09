import 'package:dotory_app/ui/view/global/select_major_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/color_data.dart';
import '../../global/custom_appbar.dart';
import '../../global/device_size.dart';

class TextFieldState {
  final String id;
  final String password;
  final String passwordCheck;
  final String major;
  final String roomNum;
  final String phone;

  TextFieldState({this.id = '',
    this.password = '', this.passwordCheck = '', this.major = '',
    this.roomNum = '', this.phone = ''});

  TextFieldState copyWith({String? id, String? password, String? passwordCheck,
    String? major, String? roomNum, String? phone}) {
    return TextFieldState(
        id: id ?? this.id,
        password: password ?? this.password,
        passwordCheck: passwordCheck ?? this.passwordCheck,
        major: major ?? this.major,
        roomNum: roomNum ?? this.roomNum,
        phone: phone ?? this.phone
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

  void updatePwCheckText(String text) {
    state = state.copyWith(passwordCheck: text);
  }

  void updateMajorText(String text) {
    state = state.copyWith(major: text);
  }

  void updateRoomNumText(String text) {
    state = state.copyWith(roomNum: text);
  }

  void updatePhoneText(String text) {
    state = state.copyWith(phone: text);
  }
}

class RegisterView extends ConsumerWidget {
  final textFieldProvider = StateNotifierProvider<TextFieldNotifier, TextFieldState>((ref) => TextFieldNotifier());
  final selectedMajorProvider = StateProvider<String?>((ref) => null);
  RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldState = ref.watch(textFieldProvider);
    final selectedMajorItem = ref.watch(selectedMajorProvider);
    var majorTextController = TextEditingController(text: selectedMajorItem ?? '');

    void onIdChanged(String text) {
      ref.read(textFieldProvider.notifier).updateIdText(text);
    }
    void onPwChanged(String text) {
      ref.read(textFieldProvider.notifier).updatePwText(text);
    }
    void onPwCheckChanged(String text) {
      ref.read(textFieldProvider.notifier).updatePwCheckText(text);
    }
    void onMajorChanged(String text) {
      ref.read(textFieldProvider.notifier).updateMajorText(text);
    }
    void onRoomNumChanged(String text) {
      ref.read(textFieldProvider.notifier).updateRoomNumText(text);
    }
    void onPhoneChanged(String text) {
      ref.read(textFieldProvider.notifier).updatePhoneText(text);
    }

    return Scaffold(
      appBar: CustomAppBar.getNavigationBar(context, '회원가입', (){
        Navigator.pop(context);
      }),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(left: 28, right: 28, top: 28, bottom: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/images/dotory_text_logo.png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: DeviceSize.getWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: TextField(
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
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Flexible(
                                flex: 1,
                                child: SizedBox(
                                    width: DeviceSize.getWidth(context),
                                    child: CupertinoButton(
                                        color: ColorData.FOCUS_COLOR,
                                        padding: const EdgeInsets.all(0),
                                        child: const Text('중복확인'),
                                        onPressed: (){})
                                )
                            )
                          ],
                        )
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
                      height: 8,
                    ),
                    TextField(
                      obscureText: true, //password 입력 효과
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: '비밀번호 확인',
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                          )
                      ),
                      onChanged: onPwCheckChanged,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: DeviceSize.getWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 3,
                            child: TextField(
                              controller: majorTextController,
                              readOnly: true, // 읽기 전용
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)
                                  ),
                                  hintText: '전공',
                                  hintStyle: TextStyle(
                                      color: Colors.grey
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                                  )
                              ),
                              onChanged: onMajorChanged,
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Flexible(
                              flex: 1,
                              child: SizedBox(
                                  width: DeviceSize.getWidth(context),
                                  child: CupertinoButton(
                                      color: ColorData.FOCUS_COLOR,
                                      padding: const EdgeInsets.all(0),
                                      child: const Text('검색'),
                                      onPressed: (){
                                        Navigator.push(
                                            context, CupertinoPageRoute(builder: (context) =>
                                              SelectMajorView(selectedMajorProvider: selectedMajorProvider)));
                                      })
                              )
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: '방번호',
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                          )
                      ),
                      onChanged: onRoomNumChanged,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: '전화번호',
                          hintStyle: TextStyle(
                              color: Colors.grey
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                          )
                      ),
                      onChanged: onPhoneChanged,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                        width: DeviceSize.getWidth(context),
                        height: 50,
                        child: CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          color: ColorData.FOCUS_COLOR,
                          child: const Text(
                              '회원가입'
                          ),
                          onPressed: (){
                          },
                        )
                    )
                  ],
                )
            )
        ),
      ),
    );
  }
}