import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Flatten', () {
    test('flattens nested lists', () {
      final nestedList = <dynamic>[
        1,
        [
          2,
          [3, 4],
          5,
        ],
        6,
        [
          7,
          [8],
        ],
      ];
      final flattenedList = nestedList.flatten();

      expect(flattenedList.toList(), [1, 2, 3, 4, 5, 6, 7, 8]);
    });

    test('flattens deeply nested structures', () {
      final nestedList = <dynamic>[
        1,
        [
          2,
          [
            3,
            [4, 5],
          ],
        ],
      ];
      final flattenedList = nestedList.flatten();

      expect(flattenedList.toList(), [1, 2, 3, 4, 5]);
    });

    test('filters out nulls by default', () {
      final nestedList = <dynamic>[
        1,
        null,
        [2, null, 3],
        null,
      ];
      final flattenedList = nestedList.flatten();

      expect(flattenedList.toList(), [1, 2, 3]);
    });

    test('retains nulls when retainNulls is true', () {
      final nestedList = <dynamic>[
        1,
        null,
        [2, null, 3],
        null,
      ];
      final flattenedList = nestedList.flatten(retainNulls: true);

      expect(flattenedList.toList(), [1, null, 2, null, 3, null]);
    });

    test('handles empty lists', () {
      final nestedList = <dynamic>[
        [],
        [[]],
        [[], []],
      ];
      final flattenedList = nestedList.flatten();

      expect(flattenedList.toList(), isEmpty);
    });

    test('handles already flat list', () {
      final flatList = [1, 2, 3, 4, 5];
      final flattenedList = flatList.flatten();

      expect(flattenedList.toList(), [1, 2, 3, 4, 5]);
    });

    test('works with different types', () {
      final nestedList = <dynamic>[
        'a',
        [
          'b',
          ['c', 'd'],
        ],
        'e',
      ];
      final flattenedList = nestedList.flatten();

      expect(flattenedList.toList(), ['a', 'b', 'c', 'd', 'e']);
    });

    test('handles mixed types with nulls', () {
      final nestedList = <dynamic>[
        1,
        'a',
        [2, 'b', null],
        null,
        [3],
      ];
      final flattenedList = nestedList.flatten();

      expect(flattenedList.toList(), [1, 'a', 2, 'b', 3]);
    });
  });
}
