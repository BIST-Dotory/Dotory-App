import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../global/color_data.dart';
import '../../global/device_size.dart';

class OutingWriteView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OutingWriteView();

}

enum RadioValue {
  outing, sleepover
}

class _OutingWriteView extends ConsumerState<OutingWriteView> {
  RadioValue _radioValue = RadioValue.outing;
  DateTime _startDateTime = DateTime.now();
  DateTime _endDateTime = DateTime.now().add(Duration(hours: 1));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: CustomAppBar.getTitleBar(context, '외박/외출 신청'),
      body: SafeArea(child: 
        Container(padding: const EdgeInsets.symmetric(horizontal: 36),
            height: DeviceSize.getHeight(context), child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Flexible(flex: 1, child: Row(
              children: [
                Row(
                  children: [
                    Radio(value: RadioValue.outing, activeColor: ColorData.FOCUS_COLOR, groupValue: _radioValue, onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    }),
                    const Text('외출')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: RadioValue.sleepover, activeColor: ColorData.FOCUS_COLOR, groupValue: _radioValue, onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    }),
                    const Text('외박')
                  ],
                ),
              ],
            )),
              const SizedBox(height: 16),
              Flexible(flex: 1, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 1, child: Text('출발 일시',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    )
                  )),
                  Flexible(flex: 2, child: CupertinoButton(
                    child: Text('${DateFormat('yyyy-MM-dd HH:mm').format(_startDateTime)}',
                      style: TextStyle(
                        color: ColorData.FOCUS_COLOR,
                      ),
                    ),
                    color: ColorData.LIGHT_GREY,
                    padding: const EdgeInsets.all(12),
                    onPressed: () => _showDateTimePicker(_startDateTime),
                  )
                  ),
                ],
              )),
              const SizedBox(height: 24),
              Flexible(flex: 1, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(flex: 1, child: Text('복귀 일시',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      )
                  )),
                  Flexible(flex: 2, child: CupertinoButton(
                    child: Text('${DateFormat('yyyy-MM-dd HH:mm').format(_endDateTime)}',
                      style: TextStyle(
                        color: ColorData.FOCUS_COLOR,
                      ),
                    ),
                    color: ColorData.LIGHT_GREY,
                    padding: const EdgeInsets.all(12),
                    onPressed: () => _showDateTimePicker(_endDateTime),
                  )
                  ),
                ],
              )),
            const SizedBox(height: 32),
            const Text('목적지', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            )),
            Flexible(flex: 1, child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  hintText: '목적지를 입력해주세요',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                  )
              ),
            )),
              const SizedBox(height: 24),
              const Text('메모(선택)', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              )),
              Flexible(flex: 1, child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    hintText: '메모(선택)',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                    )
                ),
              )),
            Flexible(flex: 10, child:
              Align(alignment: Alignment.bottomCenter, child: SizedBox(
                  width: DeviceSize.getWidth(context),
                  height: 50,
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    color: ColorData.FOCUS_COLOR,
                    child: const Text(
                        '완료'
                    ),
                    onPressed: (){
                    },
                  )
              ))
            ),
              const SizedBox(height: 16),
          ],
        ))
      ),
    );
  }

  void _showDateTimePicker(DateTime datetime) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => Container(
        height: 300,
        padding: const EdgeInsets.only(top: 10.0),
        color: Colors.white,
        child: Column(
          children: [
            // 완료 버튼
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: const Text('취소', style: TextStyle(color: ColorData.FOCUS_COLOR)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: const EdgeInsets.only(left: 16),
                  ),
                  CupertinoButton(
                    child: const Text('완료', style: TextStyle(color: ColorData.FOCUS_COLOR)),
                    onPressed: () {
                      Navigator.pop(context);
                      // 완료를 눌렀을 때 처리할 로직
                    },
                    padding: const EdgeInsets.only(right: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: datetime,
                onDateTimeChanged: (DateTime dateTime) {
                  setState(() {
                    datetime = dateTime;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}