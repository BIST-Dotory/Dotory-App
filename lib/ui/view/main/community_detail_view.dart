import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../global/color_data.dart';

class CommunityDetailView extends ConsumerStatefulWidget {
  final bool isPay;
  final String title, content, date;
  const CommunityDetailView(this.isPay, this.title, this.content, this.date, {super.key});

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
                        Text('${widget.date}', style: TextStyle(color: ColorData.GREY, fontSize: 12)),
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
                Text('${widget.title}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(height: 16),
                ..._setPriceContent(),
                Text('${widget.content}'),
                const SizedBox(height: 28),
                ..._setPictureContent(),
                Container(height: 1, color: ColorData.DARK_GREY),
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

  List<Widget> _setPriceContent() {
    if(widget.isPay) {
      return [Text('35,000원 / 인당 7,000원', style: TextStyle(color: ColorData.GREY, fontSize: 16)),
        const SizedBox(height: 28)];
    }
    return [SizedBox()];
  }

  List<Widget> _setPictureContent() {
    if(widget.isPay) {
      return [
        Container(
            height: 170,
            color: ColorData.LIGHT_GREY,
            child: Center(
              child: SvgPicture.asset('assets/images/no_image.svg'),
            ),
        ),
        const SizedBox(height: 28),
      ];
    }
    return [SizedBox()];
  }
}