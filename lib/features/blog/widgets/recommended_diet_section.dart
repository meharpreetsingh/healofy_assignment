import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/utils/app_colors.dart';

class RecommendedDietSection extends StatelessWidget {
  const RecommendedDietSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Recommended Dietery Allowance",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          3.verticalSpace,
          const Text("Daily Requiredment of Nutrients your body needs", style: TextStyle(color: AppColors.subTitle)),
          10.verticalSpace,
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            color: const Color(0xFFE6F1E9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                          Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: const Center(child: Text("Nutrients")),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: const Center(child: Text("Nutrients")),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: const Center(child: Text("Nutrients")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
