// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MapIfOfType', () {
    test('applies function when type matches', () {
      const Object? value = 'Hello';

      final uppercased = value.mapIfOfType<String, String>((stringValue) => stringValue.toUpperCase());

      expect(uppercased, 'HELLO');
    });

    test('returns null when type does not match', () {
      const Object? value = 123;

      final result = value.mapIfOfType<String, String>((stringValue) => stringValue.toUpperCase());

      expect(result, null);
    });

    test('works with number types', () {
      const Object? value = 42;

      final doubled = value.mapIfOfType<int, int>((intValue) => intValue * 2);

      expect(doubled, 84);
    });

    test('can transform to different type', () {
      const Object? value = 42;

      final result = value.mapIfOfType<int, String>((intValue) => 'Number: $intValue');

      expect(result, 'Number: 42');
    });

    test('returns null for null value', () {
      const Object? value = null;

      final result = value.mapIfOfType<String, String>((stringValue) => stringValue.toUpperCase());

      expect(result, null);
    });

    test('works with lists', () {
      final Object? value = [1, 2, 3];

      final sum = value.mapIfOfType<List<int>, int>((list) => list.reduce((a, b) => a + b));

      expect(sum, 6);
    });

    test('type checking is strict', () {
      const Object? value = 42.0;

      final intResult = value.mapIfOfType<int, String>((intValue) => 'Int: $intValue');

      expect(intResult, null);
    });
  });
}
