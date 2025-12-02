import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MinMax', () {
    test('min returns minimum value', () {
      final numbers = [5, 3, 8, 1, 4];

      expect(numbers.min, 1);
    });

    test('max returns maximum value', () {
      final numbers = [5, 3, 8, 1, 4];

      expect(numbers.max, 8);
    });

    test('works with doubles', () {
      final values = [5.5, 3.2, 8.9, 1.1, 4.4];

      expect(values.min, 1.1);
      expect(values.max, 8.9);
    });

    test('works with negative numbers', () {
      final numbers = [-5, -3, -8, -1, -4];

      expect(numbers.min, -8);
      expect(numbers.max, -1);
    });

    test('works with mixed positive and negative', () {
      final numbers = [-5, 3, -8, 1, 4];

      expect(numbers.min, -8);
      expect(numbers.max, 4);
    });

    test('works with single element', () {
      final numbers = [42];

      expect(numbers.min, 42);
      expect(numbers.max, 42);
    });

    test('works with two elements', () {
      final numbers = [10, 20];

      expect(numbers.min, 10);
      expect(numbers.max, 20);
    });

    test('handles duplicate values', () {
      final numbers = [5, 5, 5, 5];

      expect(numbers.min, 5);
      expect(numbers.max, 5);
    });
  });
}
