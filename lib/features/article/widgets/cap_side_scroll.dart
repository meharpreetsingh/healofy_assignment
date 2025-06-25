import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/article/models/article_res.dart';
import 'package:healofy_assignment/features/article/widgets/h_video_player.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';

class CapSideScroll extends StatelessWidget {
  const CapSideScroll({super.key, required this.item, this.backgroundColor});

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
          SizedBox(
            height: 250.h,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final content = item.contents[index];
                if (content.mediaType == "IMAGE") {
                  return CachedNetworkImage(imageUrl: content.url, fit: BoxFit.contain);
                }
                if (content.mediaType == "VIDEO") {
                  return Container(
                    width: 200.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                    child: HVideoPlayer(videoUrl: content.url, height: 250.h, width: 200.w),
                  );
                }
                return const SizedBox.shrink();
              },
              separatorBuilder: (context, index) => 10.horizontalSpace,
              itemCount: item.contents.length,
            ),
          ),
        ],
      ),
    );
  }
}
