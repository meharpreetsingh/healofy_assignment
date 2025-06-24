import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/utils/app_colors.dart';

class RecommendedDietSection extends StatelessWidget {
  const RecommendedDietSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> nutrientList = [
      'Energy (Kcal/D)',
      'Protein (G/D)',
      'Vitamin A (Mg/D)',
      'Iron (Mg/D)',
      'Folate (Mg/D)',
      'Iodine (Mg/Day)',
      'Calcium (Mg/D)',
      'Zinc (14.1)',
    ];
    final List<String> rdaNonPregnant = ['2850', '55', '840', '29', '220', '140', '1000', '13.2'];
    final List<String> rdaLactation = ['3450', '74', '900', '23', '330', '280', '1200', '14.1'];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      color: AppColors.backgroundDark,
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
            shadowColor: Colors.grey.shade300,
            elevation: 4,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
            color: const Color(0xFFE6F1E9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SECTION 1
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.secondary.withValues(alpha: 0.75),
                          Theme.of(context).colorScheme.primary.withValues(alpha: 0.75),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: const Center(
                            child: Text(
                              "Nutrients",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.white, indent: 20.w, endIndent: 20.w, height: 2),
                        ListView.separated(
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Text(
                            nutrientList[index],
                            style: TextStyle(fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          separatorBuilder: (context, index) =>
                              Divider(height: 10.h, color: Colors.white, indent: 20.w, endIndent: 20.w),
                          itemCount: nutrientList.length,
                        ),
                      ],
                    ),
                  ),
                ),
                // SECTION 2
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "RDA",
                                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.sp),
                              ),
                              Text(
                                "Non-Pregnant",
                                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 8.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(thickness: 2, color: Colors.black, indent: 20.w, endIndent: 20.w, height: 2),
                      ListView.separated(
                        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Text(
                          rdaNonPregnant[index],
                          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        separatorBuilder: (context, index) =>
                            Divider(height: 10.h, color: Colors.grey.shade300, indent: 20.w, endIndent: 20.w),
                        itemCount: rdaNonPregnant.length,
                      ),
                    ],
                  ),
                ),
                // SECTION 3
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "RDA",
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14.sp),
                                ),
                                Text(
                                  "Lactation",
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 8.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(thickness: 2, color: Colors.black, indent: 20.w, endIndent: 20.w, height: 2),
                        ListView.separated(
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Text(
                            rdaLactation[index],
                            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          separatorBuilder: (context, index) =>
                              Divider(height: 10.h, color: Colors.grey.shade300, indent: 20.w, endIndent: 20.w),
                          itemCount: rdaLactation.length,
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
