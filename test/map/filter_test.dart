import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Filter', () {
    test('filters by value greater than 80', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final highScores = scores.filter((entry) => entry.value > 80);

      expect(highScores.length, 2);
      expect(highScores.any((e) => e.key == 'Alice'), true);
      expect(highScores.any((e) => e.key == 'Eve'), true);
    });

    test('filters by key starting with B', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
        'Eve': 85,
      };

      final namesStartingWithB = scores.filter((entry) => entry.key.startsWith('B'));

      expect(namesStartingWithB.length, 1);
      expect(namesStartingWithB.first.key, 'Bob');
      expect(namesStartingWithB.first.value, 75);
    });

    test('returns empty when no matches', () {
      final scores = {
        'John': 80,
        'Alice': 90,
      };

      final result = scores.filter((entry) => entry.value > 100);

      expect(result, isEmpty);
    });

    test('returns all when all match', () {
      final scores = {
        'John': 80,
        'Alice': 90,
        'Bob': 75,
      };

      final result = scores.filter((entry) => entry.value > 0);

      expect(result.length, 3);
    });

    test('works with complex conditions', () {
      final data = {'user_one': 30, 'admin_two': 25, 'user_three': 28};

      final filtered = data.filter((entry) => entry.key.startsWith('u') && entry.value > 25);

      expect(filtered.length, 2);
    });
  });
}
