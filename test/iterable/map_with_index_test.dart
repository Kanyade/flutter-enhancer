import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IterationWithIndex', () {
    test('maps with index', () {
      const fruits = ['Apple', 'Banana', 'Orange', 'Mango'];

      final indexedFruits = fruits.mapWithIndex((index, fruit) => '$index: $fruit').toList();

      expect(indexedFruits, [
        '0: Apple',
        '1: Banana',
        '2: Orange',
        '3: Mango',
      ]);
    });

    test('uses index in computation', () {
      final numbers = [10, 20, 30, 40];

      final result = numbers.mapWithIndex((index, value) => value + index).toList();

      expect(result, [10, 21, 32, 43]);
    });

    test('works with empty iterable', () {
      final empty = <String>[];

      final result = empty.mapWithIndex((index, value) => '$index: $value').toList();

      expect(result, isEmpty);
    });

    test('works with single element', () {
      final single = ['only'];

      final result = single.mapWithIndex((index, value) => '$index-$value').toList();

      expect(result, ['0-only']);
    });

    test('index starts at 0', () {
      final items = ['a', 'b', 'c'];

      final result = items.mapWithIndex((index, value) => index).toList();

      expect(result, [0, 1, 2]);
    });

    test('can create objects with index', () {
      final names = ['Alice', 'Bob', 'Charlie'];

      final result = names.mapWithIndex((index, name) => {'id': index, 'name': name}).toList();

      expect(result, [
        {'id': 0, 'name': 'Alice'},
        {'id': 1, 'name': 'Bob'},
        {'id': 2, 'name': 'Charlie'},
      ]);
    });

    test('preserves original values', () {
      final original = [100, 200, 300];

      original.mapWithIndex((index, value) => value * index).toList();

      expect(original, [100, 200, 300]);
    });

    test('can change type', () {
      final numbers = [1, 2, 3, 4, 5];

      final result = numbers.mapWithIndex((index, value) => 'Item $index is $value').toList();

      expect(result, isA<List<String>>());
      expect(result.first, 'Item 0 is 1');
    });
  });
}
