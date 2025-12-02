import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Throttle', () {
    test('executes function immediately on first call', () {
      int callCount = 0;
      void incrementCount() {
        callCount++;
      }

      incrementCount.throttle(duration: const Duration(milliseconds: 100));

      expect(callCount, 1);
    });

    test('ignores subsequent calls within throttle duration', () async {
      int callCount = 0;
      void incrementCount() {
        callCount++;
      }

      const duration = Duration(milliseconds: 200);

      incrementCount.throttle(duration: duration);
      expect(callCount, 1);

      incrementCount.throttle(duration: duration);
      expect(callCount, 1);

      await Future.delayed(const Duration(milliseconds: 50));
      incrementCount.throttle(duration: duration);
      expect(callCount, 1);

      await Future.delayed(const Duration(milliseconds: 100));
      incrementCount.throttle(duration: duration);
      expect(callCount, 1);
    });

    test('allows call after throttle duration expires', () async {
      int callCount = 0;
      void incrementCount() {
        callCount++;
      }

      const duration = Duration(milliseconds: 100);

      incrementCount.throttle(duration: duration);
      expect(callCount, 1);

      await Future.delayed(const Duration(milliseconds: 150));

      incrementCount.throttle(duration: duration);
      expect(callCount, 2);
    });

    test('uses custom tag to distinguish different throttled functions', () async {
      int count1 = 0;
      int count2 = 0;

      void increment1() {
        count1++;
      }

      void increment2() {
        count2++;
      }

      const duration = Duration(milliseconds: 100);

      increment1
        ..throttle(tag: 'counter1', duration: duration)
        ..throttle(tag: 'counter1', duration: duration);
      increment2
        ..throttle(tag: 'counter2', duration: duration)
        ..throttle(tag: 'counter2', duration: duration);

      expect(count1, 1);
      expect(count2, 1);
    });

    test('uses default duration of 1 second', () async {
      int callCount = 0;
      void incrementCount() {
        callCount++;
      }

      incrementCount.throttle();
      expect(callCount, 1);

      incrementCount.throttle();
      expect(callCount, 1);

      await Future.delayed(const Duration(milliseconds: 1100));

      incrementCount.throttle();
      expect(callCount, 2);
    });

    test('throttle resets after duration', () async {
      int callCount = 0;
      void incrementCount() {
        callCount++;
      }

      const duration = Duration(milliseconds: 100);

      incrementCount.throttle(duration: duration);
      expect(callCount, 1);

      await Future.delayed(const Duration(milliseconds: 150));

      incrementCount.throttle(duration: duration);
      expect(callCount, 2);

      await Future.delayed(const Duration(milliseconds: 150));

      incrementCount.throttle(duration: duration);
      expect(callCount, 3);
    });

    test('works with nullable functions', () async {
      int? count = 0;
      void incrementCount() {
        count = count! + 1;
      }

      incrementCount..throttle(duration: const Duration(milliseconds: 50))
      ..throttle(duration: const Duration(milliseconds: 50));

      expect(count, 1);

      await Future.delayed(const Duration(milliseconds: 100));

      incrementCount.throttle(duration: const Duration(milliseconds: 50));
      expect(count, 2);
    });
  });
}
