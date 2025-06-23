import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:healofy_assignment/utils/assets.gen.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
        // TITLE SECTION
        Text(
          "Postpartum Nutrition",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        10.verticalSpace,
        // DESCRIPTION SECTION
        const Text(
          "During the postpartum period, a mother's body undergoes significant changes as it recovers from childbirth and adjusts to the demands of breastfeeding. Proper nutrition during this time is crucial to promote recovery, healing, breastfeeding success , reducing risk of postpartum complications & long term health outcomes",
        ),
        10.verticalSpace,
        // CTA
        Align(
          alignment: Alignment.centerLeft,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
              foregroundColor: Theme.of(context).colorScheme.primary,
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              shape: const StadiumBorder(),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text("Shop Now"),
          ),
        ),
      ],
    );
  }
}
