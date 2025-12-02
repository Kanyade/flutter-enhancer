import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RecursiveSearchByDataType', () {
    test('searches for string values recursively', () {
      final data = {
        'name': 'John',
        'age': 30,
        'address': {
          'street': '123 Main St',
          'city': 'New York',
          'zip': 10001,
        },
        'contact': {'email': 'john@example.com', 'phone': '555-1234'},
      };

      final stringValues = data.search<String>().toList();

      expect(stringValues.length, 5);
      expect(stringValues.any((e) => e.key == 'name' && e.value == 'John'), true);
      expect(stringValues.any((e) => e.key == 'street' && e.value == '123 Main St'), true);
      expect(stringValues.any((e) => e.key == 'city' && e.value == 'New York'), true);
      expect(stringValues.any((e) => e.key == 'email' && e.value == 'john@example.com'), true);
      expect(stringValues.any((e) => e.key == 'phone' && e.value == '555-1234'), true);
    });

    test('searches for integer values recursively', () {
      final data = {
        'name': 'John',
        'age': 30,
        'address': {
          'street': '123 Main St',
          'city': 'New York',
          'zip': 10001,
        },
        'contact': {'email': 'john@example.com', 'phone': '555-1234'},
      };

      final integerValues = data.search<int>().toList();

      expect(integerValues.length, 2);
      expect(integerValues.any((e) => e.key == 'age' && e.value == 30), true);
      expect(integerValues.any((e) => e.key == 'zip' && e.value == 10001), true);
    });

    test('returns empty for type not in map', () {
      final data = {
        'name': 'John',
        'age': 30,
      };

      final doubles = data.search<double>();

      expect(doubles, isEmpty);
    });

    test('works with deeply nested structures', () {
      final data = {
        'level1': {
          'level2': {
            'level3': {
              'value': 'deep',
            },
          },
        },
      };

      final strings = data.search<String>().toList();

      expect(strings.length, 1);
    });

    test('handles empty map', () {
      final data = <String, dynamic>{};

      final result = data.search<String>();

      expect(result, isEmpty);
    });

    test('finds multiple values of same type', () {
      final data = {
        'a': 1,
        'b': {'c': 2, 'd': 3},
        'e': {'f': 4},
      };

      final ints = data.search<int>().toList();

      expect(ints.length, 4);
    });
  });
}
