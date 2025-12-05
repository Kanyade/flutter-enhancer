import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateExtension', () {
    test('isToday returns true for today', () {
      final date = DateTime.now();

      expect(date.isToday, true);
    });

    test('isToday returns false for yesterday', () {
      final date = DateTime.now().subtract(const Duration(days: 1));

      expect(date.isToday, false);
    });

    test('addDays adds correct number of days', () {
      final date = DateTime(2020);
      final newDate = date.addDays(10);

      expect(newDate.year, 2020);
      expect(newDate.month, 1);
      expect(newDate.day, 11);
    });

    test('addMonths adds correct number of months', () {
      final date = DateTime(2020);
      final newDate = date.addMonths(2);

      expect(newDate.year, 2020);
      expect(newDate.month, 3);
      expect(newDate.day, 1);
    });

    test('addYears adds correct number of years', () {
      final date = DateTime(2020);
      final newDate = date.addYears(2);

      expect(newDate.year, 2022);
      expect(newDate.month, 1);
      expect(newDate.day, 1);
    });

    test('addHours adds correct number of hours', () {
      final date = DateTime(2020, 1, 1, 10);
      final newDate = date.addHours(5);

      expect(newDate.hour, 15);
    });

    test('nextDay returns tomorrow', () {
      final date = DateTime(2020);
      final newDate = date.nextDay;

      expect(newDate.day, 2);
    });

    test('previousDay returns yesterday', () {
      final date = DateTime(2020, 1, 2);
      final newDate = date.previousDay;

      expect(newDate.day, 1);
    });

    test('nextWeek returns date 7 days later', () {
      final date = DateTime(2020);
      final newDate = date.nextWeek;

      expect(newDate.day, 8);
    });

    test('previousWeek returns date 7 days earlier', () {
      final date = DateTime(2020, 1, 8);
      final newDate = date.previousWeek;

      expect(newDate.day, 1);
    });

    test('nextYear returns next year', () {
      final date = DateTime(2020);
      final newDate = date.nextYear;

      expect(newDate.year, 2021);
    });

    test('previousYear returns previous year', () {
      final date = DateTime(2021);
      final newDate = date.previousYear;

      expect(newDate.year, 2020);
    });

    test('nextHour returns next hour', () {
      final date = DateTime(2020, 1, 1, 10);
      final newDate = date.nextHour;

      expect(newDate.hour, 11);
    });

    test('previousHour returns previous hour', () {
      final date = DateTime(2020, 1, 1, 10);
      final newDate = date.previousHour;

      expect(newDate.hour, 9);
    });

    test('isSameDay returns true for same day', () {
      final date1 = DateTime(2020, 1, 1, 10);
      final date2 = DateTime(2020, 1, 1, 14);

      expect(date1.isSameDay(date2), true);
    });

    test('isSameDay returns false for different days', () {
      final date1 = DateTime(2020);
      final date2 = DateTime(2020, 1, 2);

      expect(date1.isSameDay(date2), false);
    });

    test('isFirstDayOfMonth returns true for first day', () {
      final date = DateTime(2020);

      expect(date.isFirstDayOfMonth, true);
    });

    test('isFirstDayOfMonth returns false for other days', () {
      final date = DateTime(2020, 1, 15);

      expect(date.isFirstDayOfMonth, false);
    });

    test('isLastDayOfMonth returns true for last day', () {
      final date = DateTime(2020, 1, 31);

      expect(date.isLastDayOfMonth, true);
    });

    test('firstDayOfMonth returns correct date', () {
      final date = DateTime(2020, 1, 15);
      final firstDay = date.firstDayOfMonth;

      expect(firstDay.day, 1);
    });

    test('lastDayOfMonth returns correct date', () {
      final date = DateTime(2020, 1, 15);
      final lastDay = date.lastDayOfMonth;

      expect(lastDay.day, 31);
    });

    test('previousMonth returns correct month', () {
      final date = DateTime(2020, 2, 15);
      final previousMonth = date.previousMonth;

      expect(previousMonth.month, 1);
    });

    test('nextMonth returns correct month', () {
      final date = DateTime(2020, 11, 15);
      final nextMonth = date.nextMonth;

      expect(nextMonth.month, 12);
    });

    test('isSameMonth returns true for same month', () {
      final date1 = DateTime(2020);
      final date2 = DateTime(2020, 1, 15);

      expect(date1.isSameMonth(date2), true);
    });

    test('isSameMonth returns false for different months', () {
      final date1 = DateTime(2020);
      final date2 = DateTime(2020, 2);

      expect(date1.isSameMonth(date2), false);
    });

    group('isSameWeek', () {
      test('returns true for dates in the same week (Monday start)', () {
        // Week starting Monday Dec 1, 2025 (Monday) to Sunday Dec 7, 2025
        final monday = DateTime(2025, 12); // Monday
        final sunday = DateTime(2025, 12, 7); // Sunday

        expect(monday.isSameWeek(sunday), true);
        expect(sunday.isSameWeek(monday), true);
      });

      test('returns true for consecutive days in same week', () {
        final thursday = DateTime(2025, 12, 4); // Thursday
        final friday = DateTime(2025, 12, 5); // Friday

        expect(thursday.isSameWeek(friday), true);
      });

      test('returns false for dates in different weeks', () {
        final sunday = DateTime(2025, 12, 7); // Sunday
        final monday = DateTime(2025, 12, 8); // Monday (next week)

        expect(sunday.isSameWeek(monday), false);
        expect(monday.isSameWeek(sunday), false);
      });

      test('returns false for dates 7 days apart in different weeks', () {
        final date1 = DateTime(2025, 12); // Monday
        final date2 = DateTime(2025, 12, 8); // Monday next week

        expect(date1.isSameWeek(date2), false);
      });

      test('returns true for same date', () {
        final date = DateTime(2025, 12, 5);

        expect(date.isSameWeek(date), true);
      });

      test('returns true for dates in the same week (Sunday start)', () {
        // Week starting Sunday Nov 30, 2025 to Saturday Dec 6, 2025
        final sunday = DateTime(2025, 11, 30); // Sunday
        final saturday = DateTime(2025, 12, 6); // Saturday

        expect(sunday.isSameWeek(saturday, startsWithMonday: false), true);
        expect(saturday.isSameWeek(sunday, startsWithMonday: false), true);
      });

      test('returns false for dates in different weeks (Sunday start)', () {
        final saturday = DateTime(2025, 12, 6); // Saturday
        final sunday = DateTime(2025, 12, 7); // Sunday (next week)

        expect(saturday.isSameWeek(sunday, startsWithMonday: false), false);
        expect(sunday.isSameWeek(saturday, startsWithMonday: false), false);
      });

      test('handles Sunday correctly with Sunday start', () {
        final sunday1 = DateTime(2025, 11, 30); // Sunday
        final sunday2 = DateTime(2025, 12, 7); // Sunday (next week)

        expect(sunday1.isSameWeek(sunday2, startsWithMonday: false), false);
      });

      test('handles week boundary differently for Monday vs Sunday start', () {
        final saturday = DateTime(2025, 12, 6); // Saturday
        final sunday = DateTime(2025, 12, 7); // Sunday

        // With Monday start: Saturday and Sunday are in the same week
        expect(saturday.isSameWeek(sunday), true);

        // With Sunday start: Saturday and Sunday are in different weeks
        expect(saturday.isSameWeek(sunday, startsWithMonday: false), false);
      });
    });

    group('isTodayOrAfter', () {
      test('isTodayOrAfter returns true for today', () {
        final date = DateTime.now();
        expect(date.isTodayOrAfter, true);
      });

      test('isTodayOrAfter returns true for future date', () {
        final date = DateTime.now().add(const Duration(days: 1));
        expect(date.isTodayOrAfter, true);
      });

      test('isTodayOrAfter returns false for past date', () {
        final date = DateTime.now().subtract(const Duration(days: 1));
        expect(date.isTodayOrAfter, false);
      });
    });

    group('isSameDayOrAfter', () {
      test('isSameDayOrAfter returns true for same day', () {
        final date1 = DateTime(2020, 1, 1, 10);
        final date2 = DateTime(2020, 1, 1, 14);
        expect(date1.isSameDayOrAfter(date2), true);
      });

      test('isSameDayOrAfter returns true for after day', () {
        final date1 = DateTime(2020, 1, 2);
        final date2 = DateTime(2020);
        expect(date1.isSameDayOrAfter(date2), true);
      });

      test('isSameDayOrAfter returns false for before day', () {
        final date1 = DateTime(2020);
        final date2 = DateTime(2020, 1, 2);
        expect(date1.isSameDayOrAfter(date2), false);
      });
    });

    group('isSameDayOrBefore', () {
      test('isSameDayOrBefore returns true for same day', () {
        final date1 = DateTime(2020, 1, 1, 10);
        final date2 = DateTime(2020, 1, 1, 14);
        expect(date1.isSameDayOrBefore(date2), true);
      });

      test('isSameDayOrBefore returns true for before day', () {
        final date1 = DateTime(2020);
        final date2 = DateTime(2020, 1, 2);
        expect(date1.isSameDayOrBefore(date2), true);
      });

      test('isSameDayOrBefore returns false for after day', () {
        final date1 = DateTime(2020, 1, 2);
        final date2 = DateTime(2020);
        expect(date1.isSameDayOrBefore(date2), false);
      });
    });
  });
}
