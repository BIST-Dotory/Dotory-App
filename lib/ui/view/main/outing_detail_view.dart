import 'package:dotory_app/ui/global/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../global/color_data.dart';

class OutingDetailView extends ConsumerStatefulWidget {
  final bool isOuting;
  final String startDate, endDate, content, place;
  const OutingDetailView(this.isOuting, this.startDate, this.endDate, this.content, this.place, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OutingDetailView();

}

class _OutingDetailView extends ConsumerState<OutingDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getNavigationBar(context, '외박/외출 조회', () => Navigator.pop(context)),
      body: SafeArea(child: Padding(padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 28), child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                widget.isOuting ? const Text('외박 신청', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24))
                    : const Text('외출 신청', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(height: 20),
                Text('출발 - ${widget.startDate}', style: TextStyle(color: ColorData.GREY, fontSize: 16)),
                const SizedBox(height: 8),
                Text('도착 - ${widget.endDate}', style: TextStyle(color: ColorData.GREY, fontSize: 16)),
                const SizedBox(height: 28),
                Text('${widget.content}', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 48),
                const Text('장소', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(height: 12),
                Text('${widget.place}', style: TextStyle(color: ColorData.GREY, fontSize: 16)),
                const SizedBox(height: 28),
                Container(
                  height: 300,
                  color: ColorData.LIGHT_GREY,
                  child: Center(
                    child: SvgPicture.asset('assets/images/no_image.svg'),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )],
      ))),
    );
  }
}