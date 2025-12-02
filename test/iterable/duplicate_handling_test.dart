import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Duplicates', () {
    test('addAllByAvoidingDuplicates merges iterables without duplicates', () {
      final Iterable<int> list1 = [1, 2, 3];
      final list2 = [3, 4, 5];
      final combined = list1.addAllByAvoidingDuplicates(list2).toList();

      expect(combined, [1, 2, 3, 4, 5]);
    });

    test('numberOfDuplicates returns correct count', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final count = duplicates.numberOfDuplicates;

      expect(count, 3);
    });

    test('numberOfDuplicates returns 0 for unique elements', () {
      final unique = [1, 2, 3, 4, 5];
      final count = unique.numberOfDuplicates;

      expect(count, 0);
    });

    test('containsDuplicates returns true when duplicates exist', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final hasDuplicates = duplicates.containsDuplicates;

      expect(hasDuplicates, true);
    });

    test('containsDuplicates returns false when no duplicates', () {
      final unique = [1, 2, 3, 4, 5];
      final hasDuplicates = unique.containsDuplicates;

      expect(hasDuplicates, false);
    });

    test('uniques returns only unique elements', () {
      final duplicates = [1, 2, 2, 3, 3, 3];
      final uniqueNumbers = duplicates.uniques;

      expect(uniqueNumbers, [1, 2, 3]);
    });

    test('duplicates returns only duplicate elements', () {
      final list = [1, 2, 2, 3, 3, 3];
      final duplicateNumbers = list.duplicates.toList();

      expect(duplicateNumbers, [2, 3, 3]);
    });

    test('duplicates returns empty for unique elements', () {
      final unique = [1, 2, 3, 4];
      final duplicateNumbers = unique.duplicates.toList();

      expect(duplicateNumbers, isEmpty);
    });

    test('works with strings', () {
      final names = ['Alice', 'Bob', 'Alice', 'Charlie'];
      final uniqueNames = names.uniques;

      expect(uniqueNames, ['Alice', 'Bob', 'Charlie']);
    });

    test('addAllByAvoidingDuplicates with no duplicates', () {
      final Iterable<int> list1 = [1, 2, 3];
      final list2 = [4, 5, 6];
      final combined = list1.addAllByAvoidingDuplicates(list2).toList();

      expect(combined, [1, 2, 3, 4, 5, 6]);
    });

    test('addAllByAvoidingDuplicates with all duplicates', () {
      final Iterable<int> list1 = [1, 2, 3];
      final list2 = [1, 2, 3];
      final combined = list1.addAllByAvoidingDuplicates(list2).toList();

      expect(combined, [1, 2, 3]);
    });
  });
}
