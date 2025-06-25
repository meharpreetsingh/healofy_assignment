import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';

class CrutialNutritionSection extends StatelessWidget {
  const CrutialNutritionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SectionHeading(text: "Crutial Nutrition & Their Sources"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const SectionSubtitle(text: "Supporting Postpartum Recovery"),
          ),
          14.verticalSpace,
          SizedBox(
            height: 200.h,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(),
              separatorBuilder: (context, index) => 10.horizontalSpace,
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
