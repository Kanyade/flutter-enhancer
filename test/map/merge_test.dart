import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Merge', () {
    test('merge combines two maps', () {
      final map1 = {
        'a': 1,
        'b': 2,
      };

      final map2 = {
        'b': 3,
        'c': 4,
      };

      final mergedMap = map1.merge(map2);

      expect(mergedMap, {
        'a': 1,
        'b': 3,
        'c': 4,
      });
    });

    test('merge with null returns original', () {
      final map1 = {'a': 1, 'b': 2};

      final result = map1.merge(null);

      expect(result, {'a': 1, 'b': 2});
    });

    test('mergeNested merges nested maps recursively', () {
      final map1 = {
        'a': 1,
        'b': {'c': 2, 'd': 3},
        'e': 4,
      };
      final map2 = {
        'b': {'c': 3, 'd': 4},
        'f': 5,
      };

      final mergedMap = map1.mergeNested(map2);

      expect(mergedMap, {
        'a': 1,
        'b': {'c': 3, 'd': 4},
        'e': 4,
        'f': 5,
      });
    });

    test('mergeNestedWithAdditions adds numerical values', () {
      final map1 = {
        'a': 1,
        'b': {'c': 2, 'd': 3},
        'f': 4,
      };
      final map2 = {
        'b': {'c': 3, 'd': 4},
        'f': const NumericalAddition(5),
      };

      final mergedMap = map1.mergeNestedWithAdditions(map2);

      expect(mergedMap, {
        'a': 1,
        'b': {'c': 3, 'd': 4},
        'f': 9,
      });
    });

    test('mergeNested handles deep nesting', () {
      final map1 = {
        'a': {
          'b': {
            'c': 1,
          },
        },
      };
      final map2 = {
        'a': {
          'b': {
            'c': 2,
            'd': 3,
          },
        },
      };

      final result = map1.mergeNested(map2);

      expect(result, {
        'a': {
          'b': {
            'c': 2,
            'd': 3,
          },
        },
      });
    });

    test('mergeNestedWithAdditions handles new keys', () {
      final map1 = <String, dynamic>{'a': 1};
      final map2 = {'b': const NumericalAddition(5)};

      final result = map1.mergeNestedWithAdditions(map2);

      expect(result, {
        'a': 1,
        'b': 5,
      });
    });

    test('mergeNested overwrites non-map values', () {
      final map1 = {'a': 1, 'b': 'old'};
      final map2 = {'b': 'new'};

      final result = map1.mergeNested(map2);

      expect(result, {
        'a': 1,
        'b': 'new',
      });
    });
  });
}
