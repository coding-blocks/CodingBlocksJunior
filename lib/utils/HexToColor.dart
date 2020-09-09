import 'dart:ui';

///
/// Convert a color hex-string to a Color object.
///
Color getColorFromHex(String hexColor, {String defaultColor = '#ffffff'}) {
  if (hexColor == null) {
    return getColorFromHex(defaultColor);
  }

  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}