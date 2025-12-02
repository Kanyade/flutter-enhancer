import 'dart:ui';

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorExtension', () {
    test('darken reduces color brightness', () {
      const originalColor = Color(0xFF808080); // Medium gray
      final darkerColor = originalColor.darken(20);

      expect(darkerColor.r, lessThan(originalColor.r));
      expect(darkerColor.g, lessThan(originalColor.g));
      expect(darkerColor.b, lessThan(originalColor.b));
    });

    test('lighten increases color brightness', () {
      const originalColor = Color(0xFF808080); // Medium gray
      final lighterColor = originalColor.lighten(20);

      expect(lighterColor.r, greaterThan(originalColor.r));
      expect(lighterColor.g, greaterThan(originalColor.g));
      expect(lighterColor.b, greaterThan(originalColor.b));
    });

    test('avg returns average color', () {
      const color1 = Color(0xFF000000); // Black
      const color2 = Color(0xFFFFFFFF); // White
      final averageColor = color1.avg(color2);

      // Average should be medium gray
      expect(averageColor.r, closeTo(0.5, 0.01));
      expect(averageColor.g, closeTo(0.5, 0.01));
      expect(averageColor.b, closeTo(0.5, 0.01));
    });

    test('darken preserves alpha', () {
      const originalColor = Color(0x80808080); // Semi-transparent gray
      final darkerColor = originalColor.darken(20);

      expect(darkerColor.a, originalColor.a);
    });

    test('lighten preserves alpha', () {
      const originalColor = Color(0x80808080); // Semi-transparent gray
      final lighterColor = originalColor.lighten(20);

      expect(lighterColor.a, originalColor.a);
    });

    test('avg averages alpha channel', () {
      const color1 = Color(0x00000000); // Transparent black
      const color2 = Color(0xFFFFFFFF); // Opaque white
      final averageColor = color1.avg(color2);

      expect(averageColor.a, closeTo(0.5, 0.01));
    });

    test('darken 100 percent results in black', () {
      const originalColor = Color(0xFFFFFFFF); // White
      final darkerColor = originalColor.darken(100);

      expect(darkerColor.r, 0);
      expect(darkerColor.g, 0);
      expect(darkerColor.b, 0);
    });

    test('lighten 100 percent results in white', () {
      const originalColor = Color(0xFF000000); // Black
      final lighterColor = originalColor.lighten(100);

      expect(lighterColor.r, 1.0);
      expect(lighterColor.g, 1.0);
      expect(lighterColor.b, 1.0);
    });

    test('avg with same color returns same color', () {
      const color = Color(0xFF123456);
      final avgColor = color.avg(color);

      expect(avgColor.toARGB32(), color.toARGB32());
    });
  });
}
