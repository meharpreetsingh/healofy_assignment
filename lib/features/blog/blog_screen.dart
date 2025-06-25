import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/blog/widgets/breastmilk_supply_section.dart';
import 'package:healofy_assignment/features/blog/widgets/looping_video_player.dart';
import 'package:healofy_assignment/features/blog/widgets/proven_hearbs_section.dart';

import 'package:healofy_assignment/features/blog/widgets/recommended_diet_section.dart';
import 'package:healofy_assignment/features/blog/widgets/recovery_bites_section.dart';
import 'package:healofy_assignment/features/blog/widgets/title_section.dart';

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
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        children: [
          // HEADER SECTION
          Container(
            height: 200.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(8.r)),
            clipBehavior: Clip.hardEdge,
            child: const LoopingVideoPlayer(
              videoUrl: "https://d2aeb2wamokgyu.cloudfront.net/Thejus/PDP-20240611T141024Z-001/PDP/21.mp4",
            ),
          ),
          10.verticalSpace,
          // TITLE SECTION
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const TitleSection(),
          ),
          20.verticalSpace,
          // RECOMMENDED DIET SECTION
          const RecommendedDietSection(),
          const Text("Postpartum Nutrition Importance Section"),
          const Text("Ignoring Postpartum Nutrition Section"),
          const Text("Crutial Nutritions & Their Sources Section"),
          const BreastmilkSupplySection(),
          const ProvenHearbsSection(),
          const Text("Postpartum Diet Essential Section"),
          const Text("Introducing Healofy Postpartum Recovery Bits Section"),
          const Text("Key Nutrients & Benefits Section"),
          // RECOVERY BITES SECTION
          const RecoveryBitesSection(),
          const Text("Astonishing Results Section"),
          const Text("Reviews Section"),
        ],
      ),
    );
  }
}
