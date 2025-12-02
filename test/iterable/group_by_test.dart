// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/foundation.dart';
import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

@immutable
class Person {
  const Person(this.name, this.role);

  final String name;
  final String role;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person && runtimeType == other.runtimeType && name == other.name && role == other.role;

  @override
  int get hashCode => name.hashCode ^ role.hashCode;
}

void main() {
  group('Group', () {
    test('groups people by role', () {
      const people = [
        Person('John', 'Manager'),
        Person('Alice', 'Engineer'),
        Person('Bob', 'Engineer'),
        Person('Charlie', 'Manager'),
        Person('Eve', 'Designer'),
      ];

      final groupedPeople = people.groupBy((person) => person.role);

      expect(groupedPeople.keys, {'Manager', 'Engineer', 'Designer'});
      expect(groupedPeople['Manager']?.length, 2);
      expect(groupedPeople['Engineer']?.length, 2);
      expect(groupedPeople['Designer']?.length, 1);
    });

    test('groups numbers by even/odd', () {
      final numbers = [1, 2, 3, 4, 5, 6, 7, 8];
      final grouped = numbers.groupBy((num) => num.isEven ? 'even' : 'odd');

      expect(grouped.keys, {'even', 'odd'});
      expect(grouped['even'], [2, 4, 6, 8]);
      expect(grouped['odd'], [1, 3, 5, 7]);
    });

    test('groups strings by length', () {
      final words = ['a', 'ab', 'abc', 'b', 'cd', 'def'];
      final grouped = words.groupBy((word) => word.length);

      expect(grouped.keys, {1, 2, 3});
      expect(grouped[1], ['a', 'b']);
      expect(grouped[2], ['ab', 'cd']);
      expect(grouped[3], ['abc', 'def']);
    });

    test('handles empty iterable', () {
      final empty = <int>[];
      final grouped = empty.groupBy((num) => num % 2);

      expect(grouped, isEmpty);
    });

    test('handles single group', () {
      final numbers = [2, 4, 6, 8];
      final grouped = numbers.groupBy((num) => 'even');

      expect(grouped.keys, {'even'});
      expect(grouped['even'], [2, 4, 6, 8]);
    });

    test('handles unique groups', () {
      final numbers = [1, 2, 3, 4];
      final grouped = numbers.groupBy((num) => num);

      expect(grouped.keys, {1, 2, 3, 4});
      expect(grouped[1], [1]);
      expect(grouped[2], [2]);
      expect(grouped[3], [3]);
      expect(grouped[4], [4]);
    });

    test('preserves order within groups', () {
      const people = [
        Person('John', 'Manager'),
        Person('Alice', 'Engineer'),
        Person('Bob', 'Engineer'),
        Person('Charlie', 'Manager'),
      ];

      final groupedPeople = people.groupBy((person) => person.role);

      final managers = groupedPeople['Manager']!.toList();
      expect(managers[0].name, 'John');
      expect(managers[1].name, 'Charlie');

      final engineers = groupedPeople['Engineer']!.toList();
      expect(engineers[0].name, 'Alice');
      expect(engineers[1].name, 'Bob');
    });
  });
}
