import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';
import 'package:healofy_assignment/utils/assets.gen.dart';

class ProvenHearbsSection extends StatelessWidget {
  const ProvenHearbsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HerbInfo> herbs = [
      HerbInfo(
        tag: "Ashwagandha",
        name: "Ashwagandha",
        description: ["Supports Stress Relief", "Enhances Energy Levels", "Boosts Immunity"],
      ),
      HerbInfo(
        tag: "Moringa",
        name: "Moringa",
        description: ["Rich in Nutrients", "Supports Lactation", "Boosts Overall Health"],
      ),
      HerbInfo(
        tag: "Fenugreek",
        name: "Fenugreek",
        description: ["Promotes Milk Production", "Supports Digestive Health", "Rich in Antioxidants"],
      ),
    ];

    final double cardHeight = 300.h;
    final double cardWidth = 200.w;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SectionHeading(text: "Proven Herbs & Spices"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SectionSubtitle(text: "For Recovery & Lactation"),
          ),
          14.verticalSpace,
          SizedBox(
            height: cardHeight,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => HerbDetailsCard(cardHeight: 300.h, cardWidth: 200.w),
              separatorBuilder: (context, index) => 10.horizontalSpace,
              itemCount: herbs.length,
            ),
          ),
        ],
      ),
    );
  }
}

class HerbDetailsCard extends StatelessWidget {
  const HerbDetailsCard({super.key, this.tag, this.name, this.description, required this.cardHeight, required this.cardWidth});

  final String? tag;
  final String? name;
  final List<String>? description;

  final double cardHeight;
  final double cardWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
          width: cardWidth,
          height: double.maxFinite,
          child: Assets.herb.image(fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: cardHeight * 0.5,
            width: cardWidth,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.2, 1],
                colors: [
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.8),
                  Theme.of(context).colorScheme.primary.withValues(alpha: 1),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: cardHeight,
          width: cardWidth,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Text(
                  tag ?? "Sowa",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              5.verticalSpace,
              Text(
                name ?? "Anethum Sowa",
                style: TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (description != null && description!.isNotEmpty)
                ...description!.map(
                  (desc) => Text(
                    desc,
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HerbInfo {
  final String tag;
  final String name;
  final List<String> description;
  final String? videoUrl;
  final String? imageUrl;

  HerbInfo({required this.tag, required this.name, required this.description, this.videoUrl, this.imageUrl});
}
