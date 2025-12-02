import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InlineRemove', () {
    test('withoutIterable removes elements from iterable', () {
      final numbers = [1, 2, 3, 4, 5];
      final newNumbers = numbers.withoutIterable([2, 4]);

      expect(newNumbers.toList(), [1, 3, 5]);
    });

    test('without removes single element', () {
      final numbers = [1, 2, 3, 4, 5];
      final newNumbers = numbers.without(3);

      expect(newNumbers.toList(), [1, 2, 4, 5]);
    });

    test('minus operator removes element', () {
      final numbers = [1, 2, 3, 4, 5];
      final newNumbers = numbers - 3;

      expect(newNumbers.toList(), [1, 2, 4, 5]);
    });

    test('withoutIterable removes all occurrences', () {
      final numbers = [1, 2, 2, 3, 2, 4];
      final newNumbers = numbers.withoutIterable([2]);

      expect(newNumbers.toList(), [1, 3, 4]);
    });

    test('without removes all occurrences', () {
      final numbers = [1, 2, 2, 3, 2, 4];
      final newNumbers = numbers.without(2);

      expect(newNumbers.toList(), [1, 3, 4]);
    });

    test('withoutIterable with no matching elements', () {
      final numbers = [1, 2, 3, 4, 5];
      final newNumbers = numbers.withoutIterable([6, 7]);

      expect(newNumbers.toList(), [1, 2, 3, 4, 5]);
    });

    test('without with no matching element', () {
      final numbers = [1, 2, 3, 4, 5];
      final newNumbers = numbers.without(10);

      expect(newNumbers.toList(), [1, 2, 3, 4, 5]);
    });

    test('works with strings', () {
      final fruits = ['apple', 'banana', 'orange', 'apple'];
      final newFruits = fruits.without('apple');

      expect(newFruits.toList(), ['banana', 'orange']);
    });

    test('withoutIterable with multiple elements', () {
      final numbers = [1, 2, 3, 4, 5, 6, 7];
      final newNumbers = numbers.withoutIterable([2, 4, 6]);

      expect(newNumbers.toList(), [1, 3, 5, 7]);
    });

    test('does not modify original iterable', () {
      final numbers = [1, 2, 3, 4, 5];
      final newNumbers = numbers - 3;

      expect(numbers.toList(), [1, 2, 3, 4, 5]);
      expect(newNumbers.toList(), [1, 2, 4, 5]);
    });

    test('works with empty iterable', () {
      final empty = <int>[];
      final result = empty.without(1);

      expect(result.toList(), isEmpty);
    });

    test('withoutIterable with empty removal list', () {
      final numbers = [1, 2, 3];
      final result = numbers.withoutIterable([]);

      expect(result.toList(), [1, 2, 3]);
    });
  });
}
