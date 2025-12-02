import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Periodic', () {
    test('calls function periodically at specified interval', () async {
      int count = 0;

      void incrementCount() {
        count++;
      }

      final timer = incrementCount.periodic(duration: const Duration(milliseconds: 100));

      await Future.delayed(const Duration(milliseconds: 350));
      timer.cancel();

      expect(count, 3);
    });

    test('timer can be cancelled', () async {
      int count = 0;

      void incrementCount() {
        count++;
      }

      final timer = incrementCount.periodic(duration: const Duration(milliseconds: 50));

      await Future.delayed(const Duration(milliseconds: 125));
      timer.cancel();

      final countAfterCancel = count;
      await Future.delayed(const Duration(milliseconds: 100));

      expect(count, countAfterCancel);
    });

    test('uses default duration of 1 second', () async {
      int count = 0;

      void incrementCount() {
        count++;
      }

      final timer = incrementCount.periodic();

      await Future.delayed(const Duration(milliseconds: 2500));
      timer.cancel();

      expect(count, 2);
    });

    test('multiple periodic timers work independently', () async {
      int count1 = 0;
      int count2 = 0;

      void incrementCount1() {
        count1++;
      }

      void incrementCount2() {
        count2++;
      }

      final timer1 = incrementCount1.periodic(duration: const Duration(milliseconds: 100));
      final timer2 = incrementCount2.periodic(duration: const Duration(milliseconds: 50));

      await Future.delayed(const Duration(milliseconds: 550));

      timer1.cancel();
      timer2.cancel();

      // timer1 runs every 100ms, so in 550ms it should run 5-6 times
      // timer2 runs every 50ms, so in 550ms it should run 10-11 times
      expect(count1, greaterThanOrEqualTo(4));
      expect(count2, greaterThanOrEqualTo(9));
    });

    test('works with nullable function', () async {
      int? count = 0;

      void incrementCount() {
        count = count! + 1;
      }

      final timer = incrementCount.periodic(duration: const Duration(milliseconds: 50));

      await Future.delayed(const Duration(milliseconds: 175));
      timer.cancel();

      expect(count, 3);
    });

    test('timer is active until cancelled', () async {
      void incrementCount() {}

      final timer = incrementCount.periodic(duration: const Duration(milliseconds: 50));

      expect(timer.isActive, true);

      await Future.delayed(const Duration(milliseconds: 75));
      expect(timer.isActive, true);

      timer.cancel();
      expect(timer.isActive, false);
    });
  });
}
