import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Debounce', () {
    test('executes function only once after debounce duration', () async {
      var callCount = 0;
      void incrementCount() {
        callCount++;
      }

      const duration = Duration(milliseconds: 100);

      incrementCount
        ..debounce(duration: duration)
        ..debounce(duration: duration)
        ..debounce(duration: duration)
        ..debounce(duration: duration);

      // Wait less than debounce duration
      await Future.delayed(const Duration(milliseconds: 50));
      expect(callCount, 0);

      // Wait for debounce duration to complete
      await Future.delayed(const Duration(milliseconds: 100));
      expect(callCount, 1);
    });

    test('resets timer on each call', () async {
      var callCount = 0;
      void incrementCount() {
        callCount++;
      }

      const duration = Duration(milliseconds: 100);

      incrementCount.debounce(duration: duration);
      await Future.delayed(const Duration(milliseconds: 50));

      incrementCount.debounce(duration: duration);
      await Future.delayed(const Duration(milliseconds: 50));

      incrementCount.debounce(duration: duration);
      await Future.delayed(const Duration(milliseconds: 50));

      expect(callCount, 0);

      await Future.delayed(const Duration(milliseconds: 100));
      expect(callCount, 1);
    });

    test('uses custom tag to distinguish different debounced functions', () async {
      var count1 = 0;
      var count2 = 0;

      void increment1() {
        count1++;
      }

      void increment2() {
        count2++;
      }

      const duration = Duration(milliseconds: 100);

      increment1
        ..debounce(tag: 'counter1', duration: duration)
        ..debounce(tag: 'counter1', duration: duration);
      increment2
        ..debounce(tag: 'counter2', duration: duration)
        ..debounce(tag: 'counter2', duration: duration);

      await Future.delayed(const Duration(milliseconds: 150));

      expect(count1, 1);
      expect(count2, 1);
    });

    test('uses default duration of 1 second', () async {
      var callCount = 0;
      void incrementCount() {
        callCount++;
      }

      incrementCount
        ..debounce()
        ..debounce();

      await Future.delayed(const Duration(milliseconds: 500));
      expect(callCount, 0);

      await Future.delayed(const Duration(milliseconds: 600));
      expect(callCount, 1);
    });

    test('works with functions returning values', () async {
      var lastValue = 0;
      int? getValue() => lastValue++;

      getValue
        ..debounce(duration: const Duration(milliseconds: 50))
        ..debounce(duration: const Duration(milliseconds: 50))
        ..debounce(duration: const Duration(milliseconds: 50));

      await Future.delayed(const Duration(milliseconds: 100));

      expect(lastValue, 1);
    });
  });
}
