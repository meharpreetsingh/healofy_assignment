import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/blog/widgets/section_heading.dart';
import 'package:healofy_assignment/features/blog/widgets/section_subtitle.dart';
import 'package:healofy_assignment/utils/app_colors.dart';
import 'package:healofy_assignment/utils/assets.gen.dart';

class BreastmilkSupplySection extends StatelessWidget {
  const BreastmilkSupplySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tips = [
      "Adequate Nutrition Is Essential For Maintaining A Healthy Milk Supply.",
      "Nutrition-Rich Foods Support The Mother's Energy Levels, Crutial for Successful Breastfeeding.",
      "Hydration Is Also Key, Drink Approx 3 Liters Of Water Daily To Support Milk Production.",
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      color: AppColors.backgroundDark,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SectionHeading(text: "Postpartum Nutrition & Breastmilk Supply"),
          const SectionSubtitle(text: "Know The Interlink"),
          14.verticalSpace,
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                clipBehavior: Clip.hardEdge,
                height: 400.h,
                width: double.maxFinite,
                child: Assets.breastfeedingMother.image(fit: BoxFit.cover),
              ),
              Container(
                height: 200.h,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0, 0.2, 0.5, 1],
                    colors: [
                      AppColors.backgroundDark.withValues(alpha: 0),
                      AppColors.backgroundDark.withValues(alpha: 0.9),
                      AppColors.backgroundDark.withValues(alpha: 1),
                      AppColors.backgroundDark,
                    ],
                  ),
                ),
                child: ListView.separated(
                  itemCount: tips.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 10.h),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => 15.verticalSpace,
                  itemBuilder: (context, index) => Row(
                    spacing: 4.w,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Icon(
                          Icons.square,
                          size: 7.sp,
                          color: Theme.of(context).colorScheme.secondary,
                          applyTextScaling: true,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          tips[index],
                          style: TextStyle(fontSize: 11.5.sp, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
