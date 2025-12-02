// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UnwrapList', () {
    test('unwraps nullable list filtering out nulls', () {
      final List<int?>? nullableList = [1, 2, null, 4];
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, [1, 2, 4]);
    });

    test('returns empty list when source is null', () {
      const List<int?>? nullableList = null;
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, isEmpty);
    });

    test('returns empty list when all items are null', () {
      final List<int?>? nullableList = [null, null, null];
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, isEmpty);
    });

    test('preserves all non-null values', () {
      final List<String?>? nullableList = ['a', 'b', 'c'];
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, ['a', 'b', 'c']);
    });

    test('works with complex types', () {
      final List<Map<String, int>?>? nullableList = [
        {'a': 1},
        null,
        {'b': 2},
      ];
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, [
        {'a': 1},
        {'b': 2},
      ]);
    });

    test('returns empty list for empty nullable list', () {
      final List<int?>? nullableList = [];
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, isEmpty);
    });

    test('preserves order of non-null elements', () {
      final List<int?>? nullableList = [1, null, 2, null, 3, 4, null, 5];
      final unwrappedList = nullableList.unwrap();

      expect(unwrappedList, [1, 2, 3, 4, 5]);
    });
  });
}
