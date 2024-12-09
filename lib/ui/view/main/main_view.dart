import 'package:dotory_app/ui/view/main/home/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global/color_data.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainView();

}

class _MainView extends State<MainView> {

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "홈"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "커뮤니티"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "외박/외출"),
  ];

  final screens = [
    HomeView(),
    HomeView(),
    HomeView()
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