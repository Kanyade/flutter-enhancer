import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WithDelay', () {
    test('converts value to future with delay', () async {
      const value = 42;
      final stopwatch = Stopwatch()..start();

      final futureValue = value.toFuture(const Duration(milliseconds: 100));
      final result = await futureValue;

      stopwatch.stop();

      expect(result, 42);
      expect(stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(100));
    });

    test('converts value to immediate future without delay', () async {
      const value = 'Hello';

      final futureValue = value.toFuture();
      final result = await futureValue;

      expect(result, 'Hello');
    });

    test('works with complex objects', () async {
      final map = {'key': 'value', 'number': 123};

      final futureValue = map.toFuture(const Duration(milliseconds: 50));
      final result = await futureValue;

      expect(result, {'key': 'value', 'number': 123});
    });

    test('works with null delay', () async {
      const value = 100;

      final futureValue = value.toFuture(null);
      final result = await futureValue;

      expect(result, 100);
    });

    test('works with lists', () async {
      final list = [1, 2, 3, 4];

      final futureValue = list.toFuture(const Duration(milliseconds: 50));
      final result = await futureValue;

      expect(result, [1, 2, 3, 4]);
    });

    test('preserves type', () async {
      const value = true;

      final futureValue = value.toFuture();
      final result = await futureValue;

      expect(result, isA<bool>());
      expect(result, true);
    });

    test('works with zero duration', () async {
      const value = 'test';

      final futureValue = value.toFuture(Duration.zero);
      final result = await futureValue;

      expect(result, 'test');
    });
  });
}
