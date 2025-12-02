// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MapToList', () {
    test('maps integers to strings', () {
      final numbers = [1, 2, 3, 4, 5];
      final numberStrings = numbers.mapList((number) => number.toString());

      expect(numberStrings, ['1', '2', '3', '4', '5']);
    });

    test('maps and transforms values', () {
      final numbers = [1, 2, 3, 4, 5];
      final doubled = numbers.mapList((number) => number * 2);

      expect(doubled, [2, 4, 6, 8, 10]);
    });

    test('maps strings to uppercase', () {
      final words = ['hello', 'world', 'flutter'];
      final uppercase = words.mapList((word) => word.toUpperCase());

      expect(uppercase, ['HELLO', 'WORLD', 'FLUTTER']);
    });

    test('works with empty iterable', () {
      final empty = <int>[];
      final result = empty.mapList((num) => num.toString());

      expect(result, isEmpty);
    });

    test('maps to different types', () {
      final numbers = [1, 2, 3];
      final result = numbers.mapList((num) => {'value': num});

      expect(result, [
        {'value': 1},
        {'value': 2},
        {'value': 3},
      ]);
    });

    test('returns a list not iterable', () {
      final numbers = [1, 2, 3];
      final result = numbers.mapList((num) => num * 2);

      expect(result, isA<List<int>>());
      expect(result.length, 3);
    });

    test('preserves order', () {
      final letters = ['a', 'b', 'c'];
      final indexed = letters.mapList((letter) => letter.toUpperCase());

      expect(indexed[0], 'A');
      expect(indexed[1], 'B');
      expect(indexed[2], 'C');
    });
  });
}
