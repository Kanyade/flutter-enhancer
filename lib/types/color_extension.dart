import 'dart:ui';

extension ColorExtension on Color {
  /// Convert the color to a darker color based on the [percent]
  /// between 1 and 100.
  ///
  /// Example usage:
  /// ```dart
  /// Color originalColor = Color(0xFF123456);
  /// Color darkerColor = originalColor.darken(20); // Darkens the color by 20%
  /// ```
  Color darken(int percent) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      _floatToInt8(a),
      (_floatToInt8(r) * value).round(),
      (_floatToInt8(g) * value).round(),
      (_floatToInt8(b) * value).round(),
    );
  }

  /// Convert the color to a lighter color based on the [percent]
  /// between 1 and 100.
  ///
  /// Example usage:
  /// ```dart
  /// Color originalColor = Color(0xFF123456);
  /// Color lighterColor = originalColor.lighten(20); // Lightens the color by 20%
  /// ```
  Color lighten(int percent) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      _floatToInt8(a),
      (_floatToInt8(r) + ((255 - _floatToInt8(r)) * value)).round(),
      (_floatToInt8(g) + ((255 - _floatToInt8(g)) * value)).round(),
      (_floatToInt8(b) + ((255 - _floatToInt8(b)) * value)).round(),
    );
  }

  /// Get the average color between this and [other] color.
  ///
  /// Example usage:
  /// ```dart
  /// Color color1 = Color(0xFF123456);
  /// Color color2 = Color(0xFF654321);
  /// Color averageColor = color1.avg(color2); // Gets the average color
  /// ```
  Color avg(Color other) {
    final red = (_floatToInt8(r) + _floatToInt8(other.r)) ~/ 2;
    final green = (_floatToInt8(g) + _floatToInt8(other.g)) ~/ 2;
    final blue = (_floatToInt8(b) + _floatToInt8(other.b)) ~/ 2;
    final alpha = (_floatToInt8(a) + _floatToInt8(other.a)) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }

  int _floatToInt8(double x) => (x * 255.0).round() & 0xff;
}
