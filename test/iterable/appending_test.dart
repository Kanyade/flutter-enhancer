import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InlineAdd', () {
    test('appends single element to iterable', () {
      final Iterable<int> numbers = [1, 2, 3];
      final newNumbers = numbers + 4;

      expect(newNumbers.toList(), [1, 2, 3, 4]);
    });

    test('works with strings', () {
      final Iterable<String> fruits = ['apple', 'banana'];
      final newFruits = fruits + 'orange';

      expect(newFruits.toList(), ['apple', 'banana', 'orange']);
    });

    test('works with empty iterable', () {
      final Iterable<int> empty = <int>[];
      final result = empty + 1;

      expect(result.toList(), [1]);
    });

    test('does not modify original iterable', () {
      final numbers = [1, 2, 3];
      final Iterable<int> iterableNumbers = numbers;
      final newNumbers = iterableNumbers + 4;

      expect(numbers, [1, 2, 3]);
      expect(newNumbers.toList(), [1, 2, 3, 4]);
    });

    test('works with complex types', () {
      final Iterable<Map<String, int>> maps = [
        {'a': 1},
        {'b': 2},
      ];
      final result = maps + {'c': 3};

      expect(result.toList(), [
        {'a': 1},
        {'b': 2},
        {'c': 3},
      ]);
    });

    test('can chain multiple additions', () {
      final Iterable<int> numbers = [1, 2];
      final result = (numbers + 3) + 4;

      expect(result.toList(), [1, 2, 3, 4]);
    });
  });
}
