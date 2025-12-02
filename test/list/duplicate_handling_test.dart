import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DuplicatesList', () {
    test('addAllByAvoidingDuplicates avoids duplicates', () {
      final numbers = [1, 2, 3]..addAllByAvoidingDuplicates([3, 4, 5]);

      expect(numbers, [1, 2, 3, 4, 5]);
    });

    test('numberOfDuplicates returns correct count', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final count = duplicates.numberOfDuplicates;

      expect(count, 3);
    });

    test('containsDuplicates returns true when duplicates exist', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final hasDuplicates = duplicates.containsDuplicates;

      expect(hasDuplicates, true);
    });

    test('containsDuplicates returns false when no duplicates', () {
      final unique = [1, 2, 3, 4];
      final hasDuplicates = unique.containsDuplicates;

      expect(hasDuplicates, false);
    });

    test('uniques returns only unique elements', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final uniqueNumbers = duplicates.uniques;

      expect(uniqueNumbers, [1, 2, 3]);
    });

    test('removeDuplicates modifies list in place', () {
      final names = ['Alice', 'Bob', 'Alice']..removeDuplicates();

      expect(names, ['Alice', 'Bob']);
    });

    test('duplicates returns only duplicate elements', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final duplicateNumbers = duplicates.duplicates;

      expect(duplicateNumbers, [2, 3, 3]);
    });

    test('duplicates returns empty for unique elements', () {
      final unique = [1, 2, 3, 4];
      final duplicateNumbers = unique.duplicates;

      expect(duplicateNumbers, isEmpty);
    });

    test('addAllByAvoidingDuplicates preserves unique values', () {
      final list = [1, 2, 3]..addAllByAvoidingDuplicates([4, 5, 6]);

      expect(list, [1, 2, 3, 4, 5, 6]);
    });

    test('removeDuplicates on already unique list', () {
      final list = [1, 2, 3, 4]..removeDuplicates();

      expect(list, [1, 2, 3, 4]);
    });
  });
}
