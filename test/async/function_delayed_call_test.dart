import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DelayedCall', () {
    test('calls function after specified duration', () async {
      int getNumbers() => 5;

      final stopwatch = Stopwatch()..start();
      final delayedNum = getNumbers.delayedCall(const Duration(milliseconds: 100));
      final result = await delayedNum;
      stopwatch.stop();

      expect(result, 5);
      expect(stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(100));
    });

    test('returns correct value after delay', () async {
      String getMessage() => 'Hello, World!';

      final result = await getMessage.delayedCall(const Duration(milliseconds: 50));

      expect(result, 'Hello, World!');
    });

    test('works with complex return types', () async {
      Map<String, int> getData() => {'a': 1, 'b': 2, 'c': 3};

      final result = await getData.delayedCall(const Duration(milliseconds: 50));

      expect(result, {'a': 1, 'b': 2, 'c': 3});
    });

    test('handles zero duration', () async {
      int getValue() => 42;

      final result = await getValue.delayedCall(Duration.zero);

      expect(result, 42);
    });

    test('multiple delayed calls work independently', () async {
      var counter = 0;
      int incrementAndReturn() => ++counter;

      final future1 = incrementAndReturn.delayedCall(const Duration(milliseconds: 100));
      final future2 = incrementAndReturn.delayedCall(const Duration(milliseconds: 50));

      final result2 = await future2;
      final result1 = await future1;

      expect(result2, 1);
      expect(result1, 2);
    });

    test('delayed call with long duration', () async {
      bool getFlag() => true;

      final stopwatch = Stopwatch()..start();
      final result = await getFlag.delayedCall(const Duration(milliseconds: 200));
      stopwatch.stop();

      expect(result, true);
      expect(stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(200));
    });
  });
}
