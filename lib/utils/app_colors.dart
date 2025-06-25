import 'dart:ui';

class AppColors {
  static const backgroundLight = Color(0xFFFFFFFF);
  static const backgroundDark = Color(0xFFF4F8F8);
  static const title = Color(0xFF164445);
  static const subTitle = Color(0xFF000000);
  static const message = Color(0xFF262626);
  static const button = Color(0xFF4F858A);
}

extension HexColor on Color {
  static Color? fromHex(String? hexString) {
    if (hexString == null || hexString.isEmpty) return null; // Return transparent color if empty
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${(255 * a).toInt().toRadixString(16).padLeft(2, '0')}'
      '${(255 * r).toInt().toRadixString(16).padLeft(2, '0')}'
      '${(255 * g).toInt().toRadixString(16).padLeft(2, '0')}'
      '${(255 * b).toInt().toRadixString(16).padLeft(2, '0')}';
}
