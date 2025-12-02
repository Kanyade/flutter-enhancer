import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnorderedEquality', () {
    test('returns true for equal unordered maps', () {
      final map1 = {
        'a': 1,
        'b': 2,
        'c': 3,
      };

      final map2 = {
        'b': 2,
        'c': 3,
        'a': 1,
      };

      final isSame = map1.isEqualTo(map2);

      expect(isSame, true);
    });

    test('returns false for different values', () {
      final map1 = {
        'a': 1,
        'b': 2,
        'c': 3,
      };

      final map3 = {
        'a': 1,
        'b': 2,
        'c': 4,
      };

      final isDifferent = map1.isEqualTo(map3);

      expect(isDifferent, false);
    });

    test('works with empty maps', () {
      final map1 = <String, int>{};
      final map2 = <String, int>{};

      expect(map1.isEqualTo(map2), true);
    });

    test('returns false for different sizes', () {
      final map1 = {'a': 1, 'b': 2};
      final map2 = {'a': 1};

      expect(map1.isEqualTo(map2), false);
    });

    test('works with nested maps', () {
      final map1 = {
        'nested': {'a': 1, 'b': 2},
      };
      final map2 = {
        'nested': {'b': 2, 'a': 1},
      };

      expect(map1.isEqualTo(map2), true);
    });

    test('returns false for different keys', () {
      final map1 = {'a': 1, 'b': 2};
      final map2 = {'a': 1, 'c': 2};

      expect(map1.isEqualTo(map2), false);
    });
  });
}
