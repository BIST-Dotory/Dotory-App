import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/color_data.dart';
import '../../global/device_size.dart';

class CommunityWriteView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityWriteView();

}

enum RadioValue {
  inquiry, pay, free
}

class _CommunityWriteView extends ConsumerState<CommunityWriteView> {
  RadioValue _radioValue = RadioValue.inquiry;
  late TextEditingController _priceController, _personController;


  @override
  void initState() {
    _priceController = TextEditingController();
    _personController = TextEditingController();
    _priceController.text = '0';
    _personController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: CustomAppBar.getTitleBar(context, '글 작성'),
      body: SafeArea(child: 
        Container(padding: const EdgeInsets.symmetric(horizontal: 36),
            height: DeviceSize.getHeight(context), child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Flexible(flex: 1, child: Row(
              children: [
                Row(
                  children: [
                    Radio(value: RadioValue.inquiry, activeColor: ColorData.FOCUS_COLOR, groupValue: _radioValue, onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    }),
                    const Text('건의사항')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: RadioValue.pay, activeColor: ColorData.FOCUS_COLOR, groupValue: _radioValue, onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    }),
                    const Text('더치페이')
                  ],
                ),
                Row(
                  children: [
                    Radio(value: RadioValue.free, activeColor: ColorData.FOCUS_COLOR, groupValue: _radioValue, onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                    }),
                    const Text('자유게시판')
                  ],
                ),
              ],
            )),
            Flexible(flex: 1, child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  hintText: '제목',
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                  )
              ),
            )),
              const SizedBox(height: 16),
            Flexible(flex: 10, child: _setContentSection()),
            Flexible(flex: 1, child: SizedBox(
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
          ],
        ))
      ),
    );
  }

  Widget _setContentSection() {
    if(_radioValue == RadioValue.pay) {
      double resultPrice = 0;
      if(_priceController.text != '0' && _personController.text != '0') {
        resultPrice = int.parse(_priceController.text) / int.parse(_personController.text);
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorData.GREY)
                  ),
                  suffixText: '원',
                  suffixStyle: TextStyle(
                      color: Colors.black
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                  ),
                ),
                controller: _priceController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                onSubmitted: (text) {
                  setState(() {
                    _priceController.text = text;
                  });
                },
              )),
              const SizedBox(width: 8),
              Flexible(child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorData.GREY)
                  ),
                  suffixText: '명',
                  suffixStyle: TextStyle(
                    color: Colors.black
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                  ),
                ),
                controller: _personController,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                  onSubmitted: (text) {
                    setState(() {
                      _personController.text = text;
                    });
                  }
              ))
            ],
          ),
          const SizedBox(height: 16),
          Text('인당 지불해야 하는 금액 : '
              '${resultPrice.toStringAsFixed(0)}원'),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: '내용을 입력해주세요',
              hintStyle: TextStyle(
                  color: Colors.grey
              ),
              focusedBorder: InputBorder.none,
            ),
            minLines: 20,
            maxLines: null,
            keyboardType: TextInputType.multiline,
          )
        ],
      );
    }
    else {
      return TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: '내용을 입력해주세요',
          hintStyle: TextStyle(
              color: Colors.grey
          ),
          focusedBorder: InputBorder.none,
        ),
        minLines: 40,
        maxLines: null,
        keyboardType: TextInputType.multiline,
      );
    }
    return Scaffold();
  }
}