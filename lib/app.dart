import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healofy_assignment/features/blog/blog_screen.dart';
import 'package:healofy_assignment/utils/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(title: "Healofy Assignment", theme: AppThemes.light(context), home: child),
      child: const BlogScreen(),
    );
  }
}
