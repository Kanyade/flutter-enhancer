// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ToMap', () {
    test('converts list to map with custom mapper', () {
      final fruits = ['apple', 'banana', 'orange'];

      final fruitLengthMap = fruits.toMap((fruit) => fruit.length);

      expect(fruitLengthMap, {
        'apple': 5,
        'banana': 6,
        'orange': 6,
      });
    });

    test('converts to uppercase map', () {
      final fruits = ['apple', 'banana', 'orange'];

      final uppercaseMap = fruits.toMap((fruit) => fruit.toUpperCase());

      expect(uppercaseMap, {
        'apple': 'APPLE',
        'banana': 'BANANA',
        'orange': 'ORANGE',
      });
    });

    test('works with numbers', () {
      final numbers = [1, 2, 3, 4];

      final squareMap = numbers.toMap((num) => num * num);

      expect(squareMap, {
        1: 1,
        2: 4,
        3: 9,
        4: 16,
      });
    });

    test('handles empty list', () {
      final empty = <String>[];

      final result = empty.toMap((item) => item.length);

      expect(result, isEmpty);
    });

    test('last value wins for duplicate keys', () {
      final items = ['a', 'b', 'a'];

      final result = items.toMap((item) => item.toUpperCase());

      expect(result, {
        'a': 'A',
        'b': 'B',
      });
      expect(result.length, 2);
    });

    test('works with complex transformations', () {
      final words = ['hello', 'world', 'test'];

      final result = words.toMap(
        (word) => {
          'length': word.length,
          'uppercase': word.toUpperCase(),
        },
      );

      expect(result['hello'], {
        'length': 5,
        'uppercase': 'HELLO',
      });
    });

    test('preserves all unique keys', () {
      final numbers = [1, 2, 3];

      final result = numbers.toMap((n) => 'number_$n');

      expect(result.length, 3);
      expect(result.keys, {1, 2, 3});
    });
  });
}
