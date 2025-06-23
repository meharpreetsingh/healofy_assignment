import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppThemes {
  static ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    textTheme: customTextTheme(Theme.of(context).textTheme).apply(fontSizeFactor: 0.8.sp),
    colorScheme: customColorScheme(Theme.of(context).colorScheme),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.primary,
        side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.5.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    ),
  );

  static ThemeData dark = ThemeData();

  static TextTheme customTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.arbutusSlab(textStyle: base.displayLarge),
      displayMedium: GoogleFonts.arbutusSlab(textStyle: base.displayMedium),
      displaySmall: GoogleFonts.arbutusSlab(textStyle: base.displaySmall),

      headlineLarge: GoogleFonts.arbutusSlab(textStyle: base.headlineLarge),
      headlineMedium: GoogleFonts.arbutusSlab(textStyle: base.headlineMedium),
      headlineSmall: GoogleFonts.arbutusSlab(textStyle: base.headlineSmall),

      titleLarge: GoogleFonts.arbutusSlab(textStyle: base.titleLarge),
      titleMedium: GoogleFonts.poppins(textStyle: base.titleMedium),
      titleSmall: GoogleFonts.poppins(textStyle: base.titleSmall),

      bodyLarge: GoogleFonts.poppins(textStyle: base.bodyLarge),
      bodyMedium: GoogleFonts.poppins(textStyle: base.bodyMedium),
      bodySmall: GoogleFonts.poppins(textStyle: base.bodySmall),

      labelLarge: GoogleFonts.poppins(textStyle: base.labelLarge),
      labelMedium: GoogleFonts.poppins(textStyle: base.labelMedium),
      labelSmall: GoogleFonts.poppins(textStyle: base.labelSmall),
    );
  }

  static ColorScheme customColorScheme(ColorScheme base) {
    return base.copyWith(
      primary: const Color(0xFF4F858A),
      secondary: const Color(0xFF164445),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xFF262626),
    );
  }
}
