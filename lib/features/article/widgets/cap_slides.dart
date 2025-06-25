import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/article/models/article_res.dart';
import 'package:healofy_assignment/features/article/widgets/h_video_player.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';

class CapSlides extends StatelessWidget {
  CapSlides({super.key, required this.item, this.backgroundColor});

  final AItem item;
  final Color? backgroundColor;

  final PageController pageController = PageController();
  final ValueNotifier<int> curPageNotified = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SectionHeading(text: item.title),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SectionSubtitle(text: item.subTitle),
          ),
          SizedBox(
            height: 400.h,
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: item.contents.length,
                  itemBuilder: (context, index) {
                    final content = item.contents[index];
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      child: switch (content.mediaType) {
                        "IMAGE" => ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: CachedNetworkImage(imageUrl: content.url),
                        ),
                        "VIDEO" => Container(
                          width: 300.w,
                          height: 400.h,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                          child: HVideoPlayer(videoUrl: content.url, height: 250.h, width: 200.w),
                        ),
                        _ => const SizedBox.shrink(),
                      },
                    );
                  },
                  onPageChanged: (index) => curPageNotified.value = index,
                ),
                // Left arrow
                if (item.contents.length > 1)
                  ValueListenableBuilder<int>(
                    valueListenable: curPageNotified,
                    builder: (context, curPage, child) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            style: IconButton.styleFrom(backgroundColor: Colors.black.withValues(alpha: 0.5)),
                            icon: Icon(Icons.keyboard_arrow_left_sharp, color: curPage > 0 ? Colors.white : Colors.white24),
                            onPressed: curPage > 0
                                ? () => pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                // Right arrow
                if (item.contents.length > 1)
                  ValueListenableBuilder<int>(
                    valueListenable: curPageNotified,
                    builder: (context, curPage, child) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            style: IconButton.styleFrom(backgroundColor: Colors.black.withValues(alpha: 0.5)),
                            icon: Icon(
                              Icons.keyboard_arrow_right_sharp,
                              color: curPage < item.contents.length - 1 ? Colors.white : Colors.white24,
                            ),
                            onPressed: curPage < item.contents.length - 1
                                ? () => pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
