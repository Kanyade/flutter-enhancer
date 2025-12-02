import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailedWhere', () {
    test('where filters by key and value', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final filteredMap = scores.where((key, value) => value >= 80);

      expect(filteredMap, {
        'John': 80,
        'Alice': 90,
        'Eve': 85,
      });
    });

    test('whereKey filters by key only', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final filteredByKey = scores.whereKey((key) => key.length == 3);

      expect(filteredByKey, {
        'Bob': 75,
        'Eve': 85,
      });
    });

    test('whereValue filters by value only', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final filteredByValue = scores.whereValue((value) => value > 80);

      expect(filteredByValue, {
        'Alice': 90,
        'Eve': 85,
      });
    });

    test('where returns empty when no matches', () {
      final scores = {'John': 80, 'Alice': 90};

      final result = scores.where((key, value) => value > 100);

      expect(result, isEmpty);
    });

    test('whereKey returns empty when no matches', () {
      final scores = {'John': 80, 'Alice': 90};

      final result = scores.whereKey((key) => key.startsWith('Z'));

      expect(result, isEmpty);
    });

    test('whereValue returns empty when no matches', () {
      final scores = {'John': 80, 'Alice': 90};

      final result = scores.whereValue((value) => value < 50);

      expect(result, isEmpty);
    });

    test('where returns all when all match', () {
      final scores = {'John': 80, 'Alice': 90, 'Bob': 75};

      final result = scores.where((key, value) => value > 0);

      expect(result.length, 3);
    });

    test('complex where condition', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final result = scores.where((key, value) => key.contains('o') && value >= 80);

      expect(
        result,
        {
          'John': 80,
          'Bob': 75,
        }.where((k, v) => v >= 80),
      );
    });

    test('whereKey with complex condition', () {
      final data = {
        'apple': 1,
        'apricot': 2,
        'banana': 3,
        'cherry': 4,
      };

      final result = data.whereKey((key) => key.startsWith('a') && key.length > 5);

      expect(result, {'apricot': 2});
    });

    test('whereValue with complex condition', () {
      final data = {
        'a': 10,
        'b': 25,
        'c': 30,
        'd': 45,
      };

      final result = data.whereValue((value) => value > 20 && value < 40);

      expect(result, {
        'b': 25,
        'c': 30,
      });
    });
  });
}
