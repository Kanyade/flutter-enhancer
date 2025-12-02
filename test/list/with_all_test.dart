import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WhenAll', () {
    test('executes callback when all elements are non-null', () {
      final numbers = <int?>[1, 2, 3];

      final sum = numbers.whenAll((values) => values.reduce((a, b) => a + b));

      expect(sum, 6);
    });

    test('returns null when any element is null', () {
      final names = <String?>['Alice', null, 'Bob'];

      final concatenated = names.whenAll((values) => values.join(', '));

      expect(concatenated, null);
    });

    test('works with all non-null strings', () {
      final names = <String?>['Alice', 'Bob', 'Charlie'];

      final result = names.whenAll((values) => values.join(', '));

      expect(result, 'Alice, Bob, Charlie');
    });

    test('returns null for list with single null', () {
      final numbers = <int?>[1, 2, null];

      final result = numbers.whenAll((values) => values.reduce((a, b) => a + b));

      expect(result, null);
    });

    test('works with empty list', () {
      final empty = <int?>[];

      final result = empty.whenAll((values) => values.length);

      expect(result, 0);
    });

    test('works with complex transformations', () {
      final numbers = <int?>[1, 2, 3, 4];

      final result = numbers.whenAll((values) => values.reduce((a, b) => a * b));

      expect(result, 24);
    });

    test('returns null immediately on first null', () {
      final numbers = <int?>[null, 1, 2, 3];

      final result = numbers.whenAll((values) => values.reduce((a, b) => a + b));

      expect(result, null);
    });

    test('works with single non-null element', () {
      final numbers = <int?>[42];

      final result = numbers.whenAll((values) => values.first);

      expect(result, 42);
    });
  });
}
