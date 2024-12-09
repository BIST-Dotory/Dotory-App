import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/color_data.dart';

class CommunityView extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityView();

}

class _CommunityView extends ConsumerState<CommunityView> {
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
                  const Text('커뮤니티', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
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
          onPressed: (){}),
    );
  }

  Widget _searchSection() {
    return SizedBox(height: 50, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        length: 5,
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
            Tab(text: "공지"),
            Tab(text: "건의사항"),
            Tab(text: "더치페이"),
            Tab(text: "자유게시판"),
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
                    children: [
                      Row(
                        children: [
                          Text('더치페이 ', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('제목'),
                        ],
                      ),
                      Text('텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트',
                          maxLines: 2,
                          style: TextStyle(overflow: TextOverflow.ellipsis, color: ColorData.DARK_GREY)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('모집인원 : 3 / 5명', textAlign: TextAlign.start, style: TextStyle(color: ColorData.DARK_GREY)),
                  Text('2024-08-08 12:00:01', textAlign: TextAlign.end, style: TextStyle(color: ColorData.DARK_GREY)),
                ],
              ),
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