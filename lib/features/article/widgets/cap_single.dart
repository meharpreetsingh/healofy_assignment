import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/article/models/article_res.dart';
import 'package:healofy_assignment/features/article/widgets/h_video_player.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';

class CapSingle extends StatelessWidget {
  const CapSingle({super.key, required this.item, this.backgroundColor});

  final AItem item;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SectionHeading(text: item.title),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SectionSubtitle(text: item.subTitle),
          ),
          10.verticalSpace,
          if (item.mediaType == "IMAGE")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
              child: CachedNetworkImage(imageUrl: item.url, fit: BoxFit.contain),
            ),

          if (item.mediaType == "VIDEO")
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
              child: HVideoPlayer(videoUrl: item.url),
            ),
        ],
      ),
    );
  }
}
