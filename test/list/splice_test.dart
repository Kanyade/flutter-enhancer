import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Splice', () {
    test('removes and returns elements', () {
      final numbers = [1, 2, 3, 4, 5];

      final removedElements = numbers.splice(1, 2);

      expect(numbers, [1, 4, 5]);
      expect(removedElements.toList(), [2, 3]);
    });

    test('replaces elements with new ones', () {
      final numbers = [1, 2, 3, 4, 5];
      final newElements = [10, 11, 12];

      final replacedElements = numbers.splice(1, 1, newElements);

      expect(numbers, [1, 10, 11, 12, 3, 4, 5]);
      expect(replacedElements.toList(), [2]);
    });

    test('inserts elements without removing', () {
      final numbers = [1, 2, 3];
      final newElements = [10, 11];

      final removed = numbers.splice(1, 0, newElements);

      expect(numbers, [1, 10, 11, 2, 3]);
      expect(removed.toList(), isEmpty);
    });

    test('removes all elements from position', () {
      final numbers = [1, 2, 3, 4, 5]..splice(2, 3);

      expect(numbers, [1, 2]);
    });

    test('works at start of list', () {
      final numbers = [1, 2, 3, 4];

      final removed = numbers.splice(0, 2);

      expect(numbers, [3, 4]);
      expect(removed.toList(), [1, 2]);
    });

    test('works at end of list', () {
      final numbers = [1, 2, 3, 4];

      final removed = numbers.splice(2, 2, [10]);

      expect(numbers, [1, 2, 10]);
      expect(removed.toList(), [3, 4]);
    });

    test('replaces with more elements', () {
      final numbers = [1, 2, 3]..splice(1, 1, [10, 11, 12, 13]);

      expect(numbers, [1, 10, 11, 12, 13, 3]);
    });

    test('replaces with fewer elements', () {
      final numbers = [1, 2, 3, 4, 5]..splice(1, 3, [10]);

      expect(numbers, [1, 10, 5]);
    });
  });
}
