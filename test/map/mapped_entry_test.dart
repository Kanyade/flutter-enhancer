import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailedMap', () {
    test('mappedKeys transforms all keys', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final uppercaseKeys = scores.mappedKeys((key) => key.toUpperCase());

      expect(uppercaseKeys, {
        'JOHN': 80,
        'ALICE': 90,
        'BOB': 75,
        'EVE': 85,
      });
    });

    test('mappedValues transforms all values', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final squaredValues = scores.mappedValues((value) => value * value);

      expect(squaredValues, {
        'John': 6400,
        'Alice': 8100,
        'Bob': 5625,
        'Eve': 7225,
      });
    });

    test('mappedKeys changes key type', () {
      final map = {
        'one': 1,
        'two': 2,
        'three': 3,
      };

      final result = map.mappedKeys((key) => key.length);

      expect(result, {
        3: 2,
        5: 3,
      });
    });

    test('mappedValues changes value type', () {
      final map = {
        'a': 1,
        'b': 2,
        'c': 3,
      };

      final result = map.mappedValues((value) => value.toString());

      expect(result, {
        'a': '1',
        'b': '2',
        'c': '3',
      });
    });

    test('works with empty map', () {
      final empty = <String, int>{};

      final keys = empty.mappedKeys((k) => k.toUpperCase());
      final values = empty.mappedValues((v) => v * 2);

      expect(keys, isEmpty);
      expect(values, isEmpty);
    });

    test('preserves map structure with mappedKeys', () {
      final map = {'a': 1, 'b': 2};

      final result = map.mappedKeys((k) => k.toUpperCase());

      expect(result.length, 2);
      expect(result.keys, {'A', 'B'});
    });
  });
}
