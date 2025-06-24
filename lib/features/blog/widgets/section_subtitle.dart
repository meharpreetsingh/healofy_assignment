import 'package:flutter/material.dart';
import 'package:healofy_assignment/utils/app_colors.dart';

class SectionSubtitle extends StatelessWidget {
  const SectionSubtitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(color: AppColors.subTitle));
  }
}
