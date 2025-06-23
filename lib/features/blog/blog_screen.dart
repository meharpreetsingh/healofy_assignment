import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healofy_assignment/features/blog/widgets/looping_video_player.dart';
import 'package:healofy_assignment/utils/assets.gen.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        children: [
          // HEADER SECTION
          Container(
            height: 200.h,
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8.r)),
            clipBehavior: Clip.hardEdge,
            child: const LoopingVideoPlayer(
              videoUrl: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/21.mp4",
            ),
          ),
          20.verticalSpace,
          // TAGS SECTION
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 5.h,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30.w,
                    child: Assets.logoFssaiWhite.image(fit: BoxFit.contain, height: 35.w, width: 40.w),
                  ),
                  Text("FDA Approved", style: TextStyle(fontSize: 9.sp)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 5.h,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30.w,
                    child: Assets.logoFssaiWhite.image(fit: BoxFit.contain, height: 35.w, width: 40.w),
                  ),
                  Text("FSSAI Certified", style: TextStyle(fontSize: 9.sp)),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 5.h,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30.w,
                    child: SvgPicture.asset(
                      "assets/gmp_logo.svg",
                      height: 35.w,
                      width: 40.w,
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  Text("GMP", style: TextStyle(fontSize: 9.sp)),
                ],
              ),
            ],
          ),
          20.verticalSpace,
          Text(
            "Postpartum Nutrition",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          10.verticalSpace,
          const Text(
            "During the postpartum period, a mother's body undergoes significant changes as it recovers from childbirth and adjusts to the demands of breastfeeding. Proper nutrition during this time is crucial to promote recovery, healing, breastfeeding success , reducing risk of postpartum complications & long term health outcomes",
          ),
          10.verticalSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                foregroundColor: Theme.of(context).colorScheme.primary,
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                shape: const StadiumBorder(), // Full border radius
                minimumSize: Size.zero, // Prevents button from expanding
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text("Shop Now"),
            ),
          ),
          20.verticalSpace,
          const Text("Recommended Dietry Allowance Section"),
          const Text("Postpartum Nutrition Importance Section"),
          const Text("Ignoring Postpartum Nutrition Section"),
          const Text("Crutial Nutritions & Their Sources Section"),
          const Text("Postpartum Nutrition & Breastmilk Supply Section"),
          const Text("Proven Herbs & Spices Section"),
          const Text("Postpartum Diet Essential Section"),
          const Text("Introducing Healofy Postpartum Recovery Bits Section"),
          const Text("Key Nutrients & Benefits Section"),
          const Text("Postpartum Recovery Bits Section"),
          const Text("Astonishing Results Section"),
          const Text("Reviews Section"),
        ],
      ),
    );
  }
}
