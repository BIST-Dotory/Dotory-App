import 'package:dotory_app/ui/view/main/community_view.dart';
import 'package:dotory_app/ui/view/main/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../global/color_data.dart';
import 'outing_view.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainView();

}

class _MainView extends State<MainView> {

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "홈"),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/icon_community.svg', width: 24, height: 24,),
        activeIcon: SvgPicture.asset('assets/images/icon_community.svg', width: 24, height: 24, colorFilter: const ColorFilter.mode(ColorData.FOCUS_COLOR, BlendMode.srcIn)),
        label: "커뮤니티"),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/images/icon_outing.svg', width: 24, height: 24),
        activeIcon: SvgPicture.asset('assets/images/icon_outing.svg', width: 24, height: 24, colorFilter: const ColorFilter.mode(ColorData.FOCUS_COLOR, BlendMode.srcIn)),
        label: "외박/외출"),
  ];

  final screens = [
    HomeView(),
    CommunityView(),
    OutingView()
  ];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: ColorData.LIGHT_GREY, width: 1.0))
          ),
          child: BottomNavigationBar(
            selectedItemColor: ColorData.FOCUS_COLOR,
            backgroundColor: Colors.white,
            elevation: 0, // 그림자 제거
            items: items,
            currentIndex: currentIndex,
            onTap: (index) => setState(() {
              currentIndex = index;
            }),
        )
      ),
    );
  }
  
}