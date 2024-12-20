import 'dart:collection';

import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:dotory_app/ui/global/device_size.dart';
import 'package:dotory_app/ui/view/global/major_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectMajorView extends ConsumerWidget {
  final selectedMainMajorItem = StateProvider<String?>((ref) => null);
  final StateProvider<String?> selectedMajorProvider;
  final List<String> majorList = ['자연과학계열', '공학계열', '인문사회계열', '예체능계열'];
  final Map<String, List<String>> subList = {'자연과학계열': ['간호학과', '치위생과', '안경광학과'],
    '공학계열': ['기계과', '전기공학과', '소방안전관리과', 'AI컴퓨터과'],
    '인문사회계열': ['유아교육과', '보건의료행정과', '경찰행정과', '장례행정복지과'],
    '예체능계열': ['시니어연기모델과', '1인디지털미디어아트과', '플로리스트과'],
  };
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
      List<String> result = subList[mainMajor]!;
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