import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MergeList', () {
    test('merge combines two lists', () {
      final numbers = [1, 2, 3, 4];
      final newNumbers = [3, 4, 5, 6, 7];

      final mergedList = numbers.merge(newNumbers);

      expect(mergedList, [1, 2, 3, 4, 3, 4, 5, 6, 7]);
    });

    test('merge with unique flag removes duplicates', () {
      final numbers = [1, 2, 3, 4];
      final newNumbers = [3, 4, 5, 6, 7];

      final uniqueMergedList = numbers.merge(newNumbers, unique: true);

      expect(uniqueMergedList, [1, 2, 3, 4, 5, 6, 7]);
    });

    test('merge does not modify original lists', () {
      final numbers = [1, 2, 3];
      final newNumbers = [4, 5];

      numbers.merge(newNumbers);

      expect(numbers, [1, 2, 3]);
      expect(newNumbers, [4, 5]);
    });

    test('merge with empty list', () {
      final numbers = [1, 2, 3];
      final empty = <int>[];

      final result = numbers.merge(empty);

      expect(result, [1, 2, 3]);
    });

    test('merge empty with non-empty', () {
      final empty = <int>[];
      final numbers = [1, 2, 3];

      final result = empty.merge(numbers);

      expect(result, [1, 2, 3]);
    });

    test('merge with unique removes all duplicates', () {
      final list1 = [1, 1, 2, 2];
      final list2 = [2, 3, 3, 4];

      final result = list1.merge(list2, unique: true);

      expect(result, [1, 1, 2, 2, 3, 4]);
    });

    test('merge preserves order', () {
      final list1 = [1, 3, 5];
      final list2 = [2, 4, 6];

      final result = list1.merge(list2);

      expect(result, [1, 3, 5, 2, 4, 6]);
    });

    test('works with strings', () {
      final fruits1 = ['apple', 'banana'];
      final fruits2 = ['cherry', 'banana'];

      final result = fruits1.merge(fruits2, unique: true);

      expect(result, ['apple', 'banana', 'cherry']);
    });
  });
}
