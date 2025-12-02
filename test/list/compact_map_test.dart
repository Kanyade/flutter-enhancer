import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CompactMap', () {
    test('maps and filters non-null values', () {
      const list = [1, 2, 3, 4, 5];

      final result = list.compactMap((value) => value.toString());

      expect(result, ['1', '2', '3', '4', '5']);
    });

    test('filters out null values', () {
      const list = [1, 2, 3, 4, 5];

      final result = list.compactMap((value) => value.isEven ? value.toString() : null);

      expect(result, ['2', '4']);
    });

    test('works with empty list', () {
      const list = <int>[];

      final result = list.compactMap((value) => value.toString());

      expect(result, isEmpty);
    });

    test('returns empty list when all values map to null', () {
      const list = [1, 3, 5, 7];

      final result = list.compactMap((value) => value.isEven ? value : null);

      expect(result, isEmpty);
    });

    test('preserves order', () {
      const list = [1, 2, 3, 4, 5, 6];

      final result = list.compactMap((value) => value.isEven ? 'even_$value' : null);

      expect(result, ['even_2', 'even_4', 'even_6']);
    });

    test('works with complex transformations', () {
      const list = ['apple', 'banana', 'a', 'cherry', 'ab'];

      final result = list.compactMap((value) => value.length > 2 ? value.toUpperCase() : null);

      expect(result, ['APPLE', 'BANANA', 'CHERRY']);
    });
  });
}
