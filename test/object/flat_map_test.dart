// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FlatMap', () {
    test('transforms non-null value', () {
      const String name = 'John';

      final capitalized = name.flatMap((value) => value.toUpperCase());

      expect(capitalized, 'JOHN');
    });

    test('returns null for null value', () {
      const String? name = null;

      final result = name.flatMap((value) => value.toUpperCase());

      expect(result, null);
    });

    test('allows transformation to different type', () {
      const int? number = 42;

      final result = number.flatMap((value) => value.toString());

      expect(result, '42');
    });

    test('can return null from transformation', () {
      const String? name = 'John';

      final result = name.flatMap((value) => value.length > 10 ? value : null);

      expect(result, null);
    });

    test('chains multiple flatMaps', () {
      const String? name = 'John';

      final result = name.flatMap((value) => value.toUpperCase()).flatMap((value) => value.substring(0, 2));

      expect(result, 'JO');
    });

    test('works with complex transformations', () {
      const int? age = 25;

      final result = age.flatMap((value) => {'age': value, 'canVote': value >= 18});

      expect(result, {'age': 25, 'canVote': true});
    });
  });
}
