import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Equality', () {
    test('isEqualToUnordered returns true for unordered equal lists', () {
      final list1 = [1, 2, 3];
      final list2 = [3, 2, 1];
      final areEqual = list1.isEqualToUnordered(list2);

      expect(areEqual, true);
    });

    test('isEqualToUnordered returns false for different lists', () {
      final list1 = [1, 2, 3];
      final list2 = [1, 2, 4];
      final areEqual = list1.isEqualToUnordered(list2);

      expect(areEqual, false);
    });

    test('isEqualTo returns true for ordered equal lists', () {
      final list1 = ['apple', 'banana', 'orange'];
      final list2 = ['apple', 'banana', 'orange'];
      final areEqual = list1.isEqualTo(list2);

      expect(areEqual, true);
    });

    test('isEqualTo returns false for different order', () {
      final list1 = ['apple', 'banana', 'orange'];
      final list2 = ['banana', 'apple', 'orange'];
      final areEqual = list1.isEqualTo(list2);

      expect(areEqual, false);
    });

    test('isEqualTo returns false for different content', () {
      final list1 = ['apple', 'banana', 'orange'];
      final list2 = ['apple', 'banana', 'grape'];
      final areEqual = list1.isEqualTo(list2);

      expect(areEqual, false);
    });

    test('works with empty lists', () {
      final list1 = <int>[];
      final list2 = <int>[];

      expect(list1.isEqualTo(list2), true);
      expect(list1.isEqualToUnordered(list2), true);
    });

    test('works with nested lists', () {
      final list1 = [
        [1, 2],
        [3, 4],
      ];
      final list2 = [
        [1, 2],
        [3, 4],
      ];

      expect(list1.isEqualTo(list2), true);
    });

    test('isEqualToUnordered with different lengths', () {
      final list1 = [1, 2, 3];
      final list2 = [1, 2];

      expect(list1.isEqualToUnordered(list2), false);
    });
  });
}
