import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReduceExtension', () {
    test('sum returns sum of all elements', () {
      final numbers = [1, 2, 3, 4, 5];

      expect(numbers.sum, 15);
    });

    test('multiplied returns product of all elements', () {
      final numbers = [1, 2, 3, 4];

      expect(numbers.multiplied, 24);
    });

    test('divided returns division result', () {
      final numbers = [100, 2, 5];

      expect(numbers.divided, 10);
    });

    test('sum works with doubles', () {
      final numbers = [1.5, 2.5, 3.0];

      expect(numbers.sum, 7.0);
    });

    test('multiplied works with doubles', () {
      final numbers = [2.0, 3.0, 1.5];

      expect(numbers.multiplied, 9.0);
    });

    test('sum with single element', () {
      final numbers = [42];

      expect(numbers.sum, 42);
    });

    test('multiplied with single element', () {
      final numbers = [42];

      expect(numbers.multiplied, 42);
    });

    test('sum with negative numbers', () {
      final numbers = [-1, -2, -3];

      expect(numbers.sum, -6);
    });

    test('multiplied with negative numbers', () {
      final numbers = [-2, -3, 2];

      expect(numbers.multiplied, 12);
    });

    test('divided with integers performs integer division', () {
      final numbers = [100, 3];

      expect(numbers.divided, 33);
    });

    test('divided with doubles performs double division', () {
      final numbers = [100.0, 3.0];

      expect(numbers.divided, closeTo(33.33, 0.01));
    });
  });
}
