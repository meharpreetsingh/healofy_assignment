import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/article/models/article_res.dart';
import 'package:healofy_assignment/features/article/view_models/article_vm.dart';
import 'package:healofy_assignment/features/article/widgets/h_video_player.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';
import 'package:healofy_assignment/utils/app_extensions.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticleVM(),
      child: Consumer<ArticleVM>(
        builder: (context, vm, child) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.person_outlined)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
              ],
            ),
            body: ListView(
              children: [
                if (vm.articleData != null)
                  ...vm.articleData!.contents.map((content) {
                    if (content.type == "CAP_TOP_VIDEO") {
                      return Container(
                        color: content.item?.background == "DARK"
                            ? vm.articleData!.theme?.backgroundDark
                            : vm.articleData!.theme?.backgroundLight,
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                        child: Container(
                          height: 200.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                          clipBehavior: Clip.hardEdge,
                          child: HVideoPlayer(videoUrl: content.item!.url, height: 200.h),
                        ),
                      );
                    }
                    if (content.type == "CAP_IMAGE") {
                      return Container(
                        color: content.item?.background == "DARK"
                            ? vm.articleData!.theme?.backgroundDark
                            : vm.articleData!.theme?.backgroundLight,
                        child: CachedNetworkImage(imageUrl: content.item!.url),
                      );
                    }
                    if (content.type == "CAP_SIDE_SCROLL") {
                      return CapSideScroll(
                        item: content.item!,
                        backgroundColor: content.item?.background == "DARK"
                            ? vm.articleData!.theme?.backgroundDark
                            : vm.articleData!.theme?.backgroundLight,
                      );
                    }
                    if (content.type == "CAP_SLIDES") {
                      return CapSlides(
                        item: content.item!,
                        backgroundColor: content.item?.background == "DARK"
                            ? vm.articleData!.theme?.backgroundDark
                            : vm.articleData!.theme?.backgroundLight,
                      );
                    }
                    return const SizedBox.shrink();
                  }),
              ],
            ).asEmpty(isEmpty: vm.articleData == null).asLoading(isLoading: vm.fetchingArticle),
          );
        },
      ),
    );
  }
}

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
