import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NumberUtils', () {
    test('isPositive returns true for positive numbers', () {
      const number = 5;

      expect(number.isPositive, true);
    });

    test('isPositive returns false for zero', () {
      const number = 0;

      expect(number.isPositive, false);
    });

    test('isPositive returns false for negative', () {
      const number = -5;

      expect(number.isPositive, false);
    });

    test('isPositiveOrZero returns true for zero', () {
      const number = 0;

      expect(number.isPositiveOrZero, true);
    });

    test('isPositiveOrZero returns true for positive', () {
      const number = 5;

      expect(number.isPositiveOrZero, true);
    });

    test('isNegative returns true for negative numbers', () {
      const number = -5;

      expect(number.isNegative, true);
    });

    test('isNegative returns false for zero', () {
      const number = 0;

      expect(number.isNegative, false);
    });

    test('isNegativeOrZero returns true for zero', () {
      const number = 0;

      expect(number.isNegativeOrZero, true);
    });

    test('isNegativeOrZero returns true for negative', () {
      const number = -5;

      expect(number.isNegativeOrZero, true);
    });

    test('isZero returns true for zero', () {
      const number = 0;

      expect(number.isZero, true);
    });

    test('isZero returns false for non-zero', () {
      const number = 5;

      expect(number.isZero, false);
    });

    test('isInteger returns true for whole number double', () {
      const number = 5.0;

      expect(number.isInteger, true);
    });

    test('isInteger returns false for decimal', () {
      const number = 5.5;

      expect(number.isInteger, false);
    });

    test('isDouble returns true for decimal', () {
      const number = 5.5;

      expect(number.isDouble, true);
    });

    test('isDouble returns true for whole number double', () {
      const number = 5.0;

      expect(number.isDouble, true);
    });

    test('works with negative zero', () {
      const number = -0.0;

      expect(number.isZero, true);
      expect(number.isNegativeOrZero, true);
      expect(number.isPositiveOrZero, true);
    });

    test('works with very small positive number', () {
      const number = 0.0001;

      expect(number.isPositive, true);
      expect(number.isNegative, false);
    });

    test('works with very small negative number', () {
      const number = -0.0001;

      expect(number.isNegative, true);
      expect(number.isPositive, false);
    });
  });
}
