import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/blog/widgets/looping_video_player.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';

class RecoveryBitesSection extends StatelessWidget {
  const RecoveryBitesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionHeading(text: "Postpartum Recovery Bites"),
          const SectionSubtitle(text: "Works To Boost Recovery Immunity & Baby's Brain"),
          14.verticalSpace,
          Container(
            height: 200.h,
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8.r)),
            clipBehavior: Clip.hardEdge,
            child: const LoopingVideoPlayer(
              videoUrl: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/71.mp4",
            ),
          ),
        ],
      ),
    );
  }
}
