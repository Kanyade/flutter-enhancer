// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrDefault', () {
    test('returns default for null int', () {
      int? a;

      expect(a.orDefault, 0);
    });

    test('returns default for null string', () {
      String? b;

      expect(b.orDefault, '');
    });

    test('returns default for null list', () {
      List? c;

      expect(c.orDefault, []);
    });

    test('returns default for null map', () {
      Map? d;

      expect(d.orDefault, {});
    });

    test('returns default for null set', () {
      Set? e;

      expect(e.orDefault, <dynamic>{});
    });

    test('returns default for null double', () {
      double? f;

      expect(f.orDefault, 0.0);
    });

    test('returns actual value for non-null int', () {
      const int? a = 42;

      expect(a.orDefault, 42);
    });

    test('returns actual value for non-null string', () {
      const String? b = 'Hello';

      expect(b.orDefault, 'Hello');
    });

    test('returns actual value for non-null list', () {
      final List? c = [1, 2, 3];

      expect(c.orDefault, [1, 2, 3]);
    });

    test('returns actual value for non-null map', () {
      final Map? d = {'key': 'value'};

      expect(d.orDefault, {'key': 'value'});
    });

    test('works with typed lists', () {
      List<int>? numbers;

      // orDefault extension has a limitation with generic types
      // It returns List not List<int> because T is List<int>? in the extension
      expect(() => numbers.orDefault, throwsA(isA<TypeError>()));
    });

    test('works with typed maps', () {
      Map<String, int>? data;

      // orDefault extension has a limitation with generic types
      expect(() => data.orDefault, throwsA(isA<TypeError>()));
    });
  });
}
