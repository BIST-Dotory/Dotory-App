import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/color_data.dart';

class CommunityDetailView extends ConsumerStatefulWidget {
  final bool isPay;
  const CommunityDetailView(this.isPay, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommunityDetailView();

}

class _CommunityDetailView extends ConsumerState<CommunityDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getNavigationBar(context, '', () => Navigator.pop(context)),
      body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28), child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 50, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 48, height: 48, child: CircleAvatar(backgroundColor: ColorData.LIGHT_GREY)),
                    const SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('유저1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        Text('12/02 01:01', style: TextStyle(color: ColorData.GREY, fontSize: 12)),
                      ],
                    ),
                    widget.isPay ?
                    Flexible(flex: 2, child: Align(alignment: Alignment.centerRight, child: CupertinoButton(child: const Text('참여하기'),
                      onPressed: (){},
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      borderRadius: BorderRadius.circular(100),
                      color: ColorData.FOCUS_COLOR,
                    ))) : const Flexible(flex: 2, child: Align(alignment: Alignment.centerRight, child: Text('')))
                  ],
                )),
                const SizedBox(height: 24),
                Text('제목제목제목', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(height: 16),
                Text('35,000원 / 인당 7,000원', style: TextStyle(color: ColorData.GREY, fontSize: 16)),
                const SizedBox(height: 28),
                const Text('내용내용내용내용내용내용내용내용내용내내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용'),
                const SizedBox(height: 28),
                Container(height: 1, color: ColorData.DARK_GREY),
                const SizedBox(height: 28),
                const Spacer(),
                TextField(
                  decoration: InputDecoration(
                      hintText: '댓글을 입력해주세요.',
                      hintStyle: TextStyle(color: ColorData.GREY),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      suffixIcon: Icon(Icons.send)
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
        )],
      ))),
    );
  }
}