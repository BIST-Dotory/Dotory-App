import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dotory_app/ui/view/main/outing_write_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/color_data.dart';

class OutingView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OutingView();

}

class _OutingView extends ConsumerState<OutingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(width: 40, height: 40, child:Image.asset('assets/images/dotory_logo.png')),
                  const SizedBox(height: 24),
                  const Text('외박/외출', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  const SizedBox(height: 32),
                  _searchSection(),
                  const SizedBox(height: 16),
                  _tabMenuSection(),
                  const SizedBox(height: 36),
                  _contentSection()
                ],
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorData.FOCUS_COLOR,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: (){
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => OutingWriteView()));
          }),
    );
  }

  Widget _searchSection() {
    return SizedBox(height: 50, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(flex: 4, child: TextField(
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                ),
                hintText: '검색어를 입력해주세요',
                hintStyle: TextStyle(
                    color: Colors.grey
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ColorData.FOCUS_COLOR)
                )
            )
        )),
        Flexible(flex: 1, child: CupertinoButton(
            padding: EdgeInsets.all(0),
            color: ColorData.FOCUS_COLOR,
            child: Icon(CupertinoIcons.search),
            onPressed: () => {}))
      ],
    ));
  }

  Widget _tabMenuSection() {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: ButtonsTabBar(
          backgroundColor: ColorData.LIGHT_GREY,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          radius: 8,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          tabs: const [
            Tab(text: "전체"),
            Tab(text: "외박"),
            Tab(text: "외출"),
          ],
        )
    );
  }

  Widget _contentSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Flexible(child: Padding(padding: EdgeInsets.only(right: 20) ,child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('외박 ', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('서면'),
                        ],
                      ),
                      Text('친구랑 술 한잔 하러 가겠습니다.',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: TextStyle(overflow: TextOverflow.ellipsis,
                              color: ColorData.DARK_GREY)),
                    ],
                  ))),
                  Container(width: 58, height: 58,
                    decoration: BoxDecoration(
                        color: ColorData.LIGHT_GREY
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text('2024-08-08 12:00:01 ~ 2024-08-08 12:00:01',
                  textAlign: TextAlign.end, style: TextStyle(color: ColorData.DARK_GREY)),
              const SizedBox(height: 20),
              Container(
                height: 1,
                color: ColorData.DARK_GREY,
              )
            ],
          )
        ],
      ),
    );
  }

}