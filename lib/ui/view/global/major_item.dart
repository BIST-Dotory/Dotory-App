import 'package:dotory_app/ui/view/global/select_major_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MajorItem extends ConsumerWidget {
  final StateProvider<String?> selectedMajorProvider;
  final String majorName;
  final bool isSub;
  const MajorItem({super.key, required this.majorName, required this.isSub,
    required this.selectedMajorProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if(!isSub) {
          ref.read(selectedMajorProvider.notifier).state = majorName;
        }
        else {
          ref.read(selectedMajorProvider!.notifier).state = majorName;
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black)
        ),
        child: Center(
          child: Text(majorName),
        ),
      )
    );
  }
}