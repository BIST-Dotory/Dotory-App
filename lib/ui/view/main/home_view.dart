import 'package:dotory_app/ui/global/color_data.dart';
import 'package:dotory_app/ui/global/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(width: 40, height: 40, child:Image.asset('assets/images/dotory_logo.png')),
                    const SizedBox(height: 24),
                    _userInfo(context),
                    const SizedBox(height: 40),
                    _dormitoryInfo(context),
                    const SizedBox(height: 32),
                    _recentInfo(context)
                  ],
              ),
            )
          )
      ),
    );
  }

  // 로그인 한 사용자 정보
  Widget _userInfo(BuildContext context) {
    return SizedBox(
        width: DeviceSize.getWidth(context),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'OOO님 환영합니다!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text('컴퓨터소프트웨어과',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorData.GREY
                        ),
                    )
                  ],
              )
            ),
            Flexible(flex: 1, child: SizedBox(width: 48, height: 48, child: CircleAvatar(backgroundColor: ColorData.LIGHT_GREY)))
          ],
      )
    );
  }

  // 사용자 기숙사 관련 정보(상점, 벌점, 외출/외박)
  Widget _dormitoryInfo(BuildContext context) {
    return SizedBox(
      width: DeviceSize.getWidth(context),
      height: 220,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 14),
                decoration: BoxDecoration(
                    color: ColorData.LIGHT_GREY,
                  borderRadius: BorderRadius.circular(12)
                ),
                width: DeviceSize.getWidth(context),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('상점', textAlign: TextAlign.start),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Baseline(baseline: 32, baselineType: TextBaseline.alphabetic, child: Text('20',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32))),
                        Baseline(baseline: 24, baselineType: TextBaseline.alphabetic, child: Text('점'))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 14),
                decoration: BoxDecoration(
                    color: ColorData.LIGHT_GREY,
                    borderRadius: BorderRadius.circular(12)
                ),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('벌점', textAlign: TextAlign.start),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Baseline(baseline: 32, baselineType: TextBaseline.alphabetic, child: Text('20',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32))),
                        Baseline(baseline: 24, baselineType: TextBaseline.alphabetic, child: Text('점'))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
          ),
          const SizedBox(width: 28),
          Flexible(child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorData.LIGHT_GREY
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('오늘의 외출/외박', textAlign: TextAlign.center)
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  Widget _recentInfo(BuildContext context) {
    return SizedBox(
      width: DeviceSize.getWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("최신 게시물",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorData.LIGHT_GREY
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Flexible(child: Padding(padding: EdgeInsets.only(right: 20) ,child: Column(
                      children: [
                        Row(
                          children: [
                            Text('공지사항 ', style: TextStyle(fontWeight: FontWeight.bold)),
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
                        color: ColorData.COLOR_WHITE
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text('2024-08-08 12:00:01', textAlign: TextAlign.end, style: TextStyle(color: ColorData.DARK_GREY))
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
              padding: const EdgeInsets.all(14),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorData.LIGHT_GREY
            ),
            child : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Flexible(child: Padding(padding: EdgeInsets.only(right: 20) ,child: Column(
                      children: [
                        Row(
                          children: [
                            Text('건의사항 ', style: TextStyle(fontWeight: FontWeight.bold)),
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
                          color: ColorData.COLOR_WHITE
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text('2024-08-08 12:00:01', textAlign: TextAlign.end, style: TextStyle(color: ColorData.DARK_GREY))
              ],
            )
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorData.LIGHT_GREY
            ),
            child: Column(
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
                          color: ColorData.COLOR_WHITE
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Text('2024-08-08 12:00:01', textAlign: TextAlign.end, style: TextStyle(color: ColorData.DARK_GREY))
              ],
            ),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }
}