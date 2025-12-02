import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddOperator', () {
    test('adds two maps together', () {
      final map1 = {
        'a': 1,
        'b': 2,
      };

      final map2 = {
        'b': 3,
        'c': 4,
      };

      final combinedMap = map1 + map2;

      expect(combinedMap, {
        'a': 1,
        'b': 3,
        'c': 4,
      });
    });

    test('does not modify original maps', () {
      final map1 = {'a': 1, 'b': 2};
      final map2 = {'c': 3};

      final map3 = map1 + map2;

      expect(map1, {'a': 1, 'b': 2});
      expect(map2, {'c': 3});
      expect(map3, {'a': 1, 'b': 2, 'c': 3});
    });

    test('later map values overwrite earlier ones', () {
      final map1 = {'key': 'value1'};
      final map2 = {'key': 'value2'};

      final result = map1 + map2;

      expect(result['key'], 'value2');
    });

    test('works with empty maps', () {
      final map1 = <String, int>{};
      final map2 = {'a': 1};

      final result = map1 + map2;

      expect(result, {'a': 1});
    });

    test('adding empty map returns original', () {
      final map1 = {'a': 1, 'b': 2};
      final map2 = <String, int>{};

      final result = map1 + map2;

      expect(result, {'a': 1, 'b': 2});
    });

    test('works with complex values', () {
      final map1 = {
        'list1': [1, 2, 3],
      };
      final map2 = {
        'list2': [4, 5, 6],
      };

      final result = map1 + map2;

      expect(result, {
        'list1': [1, 2, 3],
        'list2': [4, 5, 6],
      });
    });
  });
}
