import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntExtension', () {
    test('millis converts to milliseconds duration', () {
      const durationInMillis = 500;
      final duration = durationInMillis.millis;

      expect(duration.inMilliseconds, 500);
    });

    test('seconds converts to seconds duration', () {
      const durationInSeconds = 5;
      final duration = durationInSeconds.seconds;

      expect(duration.inSeconds, 5);
    });

    test('minutes converts to minutes duration', () {
      const durationInMinutes = 10;
      final duration = durationInMinutes.minutes;

      expect(duration.inMinutes, 10);
    });

    test('hours converts to hours duration', () {
      const durationInHours = 2;
      final duration = durationInHours.hours;

      expect(duration.inHours, 2);
    });

    test('days converts to days duration', () {
      const durationInDays = 1;
      final duration = durationInDays.days;

      expect(duration.inDays, 1);
    });

    test('rangeTo creates inclusive range ascending', () {
      const start = 3;
      const end = 7;
      final range = start.rangeTo(end);

      expect(range.toList(), [3, 4, 5, 6, 7]);
    });

    test('rangeTo creates exclusive range ascending', () {
      const start = 3;
      const end = 7;
      final range = start.rangeTo(end, inclusive: false);

      expect(range.toList(), [3, 4, 5, 6]);
    });

    test('rangeTo creates inclusive range descending', () {
      const start = 7;
      const end = 3;
      final range = start.rangeTo(end);

      expect(range.toList(), [7, 6, 5, 4, 3]);
    });

    test('rangeTo creates exclusive range descending', () {
      const start = 7;
      const end = 3;
      final range = start.rangeTo(end, inclusive: false);

      expect(range.toList(), [7, 6, 5, 4]);
    });

    test('rangeTo with same start and end inclusive', () {
      const start = 5;
      const end = 5;
      final range = start.rangeTo(end);

      expect(range.toList(), [5]);
    });

    test('rangeTo with same start and end exclusive', () {
      const start = 5;
      const end = 5;
      final range = start.rangeTo(end, inclusive: false);

      expect(range.toList(), []);
    });

    test('rangeTo with negative numbers', () {
      const start = -3;
      const end = 2;
      final range = start.rangeTo(end);

      expect(range.toList(), [-3, -2, -1, 0, 1, 2]);
    });
  });
}
