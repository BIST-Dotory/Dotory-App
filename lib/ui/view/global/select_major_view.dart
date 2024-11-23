import 'dart:collection';

import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:dotory_app/ui/global/device_size.dart';
import 'package:dotory_app/ui/view/global/major_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectMajorView extends ConsumerWidget {
  final selectedMainMajorItem = StateProvider<String?>((ref) => null);
  final StateProvider<String?> selectedMajorProvider;
  final List<String> majorList = ['A', 'B'];
  final Map<String, String> subList = {'A': '간호학과', 'B': '테스트과'};
  final List<String> subMajorList = [];
  SelectMajorView({super.key, required this.selectedMajorProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(selectedMainMajorItem);
    return Scaffold(
      appBar: CustomAppBar.getTitleBar(context, '전공 선택'),
      body: SizedBox(
        width: DeviceSize.getWidth(context),
        child: Row(
          children: [
            Flexible(child: _mainMajor()),
            Flexible(child: _subMajor(selectedItem))
          ],
        ),
      )
    );
  }

  Widget _mainMajor() {
    return ListView.builder(
        itemCount: majorList.length,
        itemBuilder: (context, index){
          return MajorItem(majorName: majorList[index],
            isSub: false,
            selectedMajorProvider: selectedMainMajorItem,
          );
        });
  }

  Widget _subMajor(String? mainMajor) {
    subMajorList.clear();
    if (mainMajor != null) {
      List<String> result = [mainMajor].map((key) => subList[key]!).toList();
      subMajorList.addAll(result);
    }
    return ListView.builder(
        itemCount: subMajorList.length,
        itemBuilder: (context, index){
          return MajorItem(majorName: subMajorList[index],
              isSub: true,
              selectedMajorProvider: selectedMajorProvider);
        });
  }
}