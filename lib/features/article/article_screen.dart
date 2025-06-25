import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/article/view_models/article_vm.dart';
import 'package:healofy_assignment/features/article/widgets/cap_side_scroll.dart';
import 'package:healofy_assignment/features/article/widgets/cap_single.dart';
import 'package:healofy_assignment/features/article/widgets/cap_slides.dart';
import 'package:healofy_assignment/features/article/widgets/h_video_player.dart';
import 'package:healofy_assignment/features/article/widgets/video_reviews.dart';
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
                    if (content.type == "CAP_SINGLE") {
                      return CapSingle(
                        item: content.item!,
                        backgroundColor: content.item?.background == "DARK"
                            ? vm.articleData!.theme?.backgroundDark
                            : vm.articleData!.theme?.backgroundLight,
                      );
                    }
                    if (content.type == "VIDEO_REVIEWS") {
                      return VideoReviews(
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
