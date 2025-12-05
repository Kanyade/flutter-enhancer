extension DateExtension on DateTime {
  /// Checks if the date is today.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.isToday); // true
  /// ```
  bool get isToday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  /// Checks if the date is today or before.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.isTodayOrBefore); // true
  /// ```
  bool get isTodayOrBefore {
    final nowDate = DateTime.now();
    return year < nowDate.year ||
        (year == nowDate.year && month < nowDate.month) ||
        (year == nowDate.year && month == nowDate.month && day <= nowDate.day);
  }

  /// Checks if the date is today or after.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.isTodayOrAfter); // true
  /// ```
  bool get isTodayOrAfter {
    final nowDate = DateTime.now();
    return year > nowDate.year ||
        (year == nowDate.year && month > nowDate.month) ||
        (year == nowDate.year && month == nowDate.month && day >= nowDate.day);
  }

  /// Checks if the date is yesterday.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime.now().addDays(-1);
  /// print(date.isYesterday); // true
  /// ```
  bool get isYesterday {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day - 1;
  }

  /// Checks if the date is tomorrow.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime.now().addDays(1);
  /// print(date.isTomorrow); // true
  /// ```
  bool get isTomorrow {
    final nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day + 1;
  }

  /// Adds a specified number of years to the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.addYears(2);
  /// print(newDate); // 2022-01-01 00:00:00.000
  /// ```
  DateTime addYears(int amount) => DateTime(year + amount, month, day, hour, minute, second);

  /// Adds a specified number of months to the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.addMonths(2);
  /// print(newDate); // 2020-03-01 00:00:00.000
  /// ```
  DateTime addMonths(int amount) => DateTime(year, month + amount, day, hour, minute, second);

  /// Adds a specified number of days to the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.addDays(10);
  /// print(newDate); // 2020-01-11 00:00:00.000
  /// ```
  DateTime addDays(int amount) => add(Duration(days: amount));

  /// Adds a specified number of hours to the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1, 10, 0, 0);
  /// final newDate = date.addHours(5);
  /// print(newDate); // 2020-01-01 15:00:00.000
  /// ```
  DateTime addHours(int amount) => add(Duration(hours: amount));

  /// Returns a new DateTime instance with an hour added to the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1, 10, 0, 0);
  /// final newDate = date.nextHour;
  /// print(newDate); // 2020-01-01 11:00:00.000
  /// ```
  DateTime get nextHour => addHours(1);

  /// Returns a new DateTime instance with an hour subtracted from the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1, 10, 0, 0);
  /// final newDate = date.previousHour;
  /// print(newDate); // 2020-01-01 09:00:00.000
  /// ```
  DateTime get previousHour => addHours(-1);

  /// Returns a new DateTime instance with a day added to the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.nextDay;
  /// print(newDate); // 2020-01-02 00:00:00.000
  /// ```
  DateTime get nextDay => addDays(1);

  /// Returns a new DateTime instance with a day subtracted from the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.previousDay;
  /// print(newDate); // 2019-12-31 00:00:00.000
  /// ```
  DateTime get previousDay => addDays(-1);

  /// Returns a new DateTime instance with a week subtracted from the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.previousWeek;
  /// print(newDate); // 2019-12-25 00:00:00.000
  /// ```
  DateTime get previousWeek => addDays(-7);

  /// Returns a new DateTime instance with a week added to the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.nextWeek;
  /// print(newDate); // 2020-01-08 00:00:00.000
  /// ```
  DateTime get nextWeek => addDays(7);

  /// Returns a new DateTime instance with a year added to the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.nextYear;
  /// print(newDate); // 2021-01-01 00:00:00.000
  /// ```
  DateTime get nextYear => addYears(1);

  /// Returns a new DateTime instance with a year subtracted from the current instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// final newDate = date.previousYear;
  /// print(newDate); // 2019-01-01 00:00:00.000
  /// ```
  DateTime get previousYear => addYears(-1);

  /// Checks if two DateTime instances represent the same calendar day.
  ///
  /// Example usage:
  /// ```dart
  /// final date1 = DateTime(2020, 1, 1);
  /// final date2 = DateTime(2020, 1, 1, 12, 0, 0);
  /// print(date1.isSameDay(date2)); // true
  /// ```
  bool isSameDay(DateTime b) => year == b.year && month == b.month && day == b.day;

  /// Checks if [other] is the same day as [this] or in the future.
  ///
  /// Example usage:
  /// ```dart
  /// final date1 = DateTime(2020, 1, 1);
  /// final date2 = DateTime(2020, 1, 1, 12, 0, 0);
  /// print(date1.isSameDayOrAfter(date2)); // true
  /// ```
  bool isSameDayOrAfter(DateTime other) => isAfter(other) || isSameDay(other);

  /// Checks if [other] is the same day as [this] or in the past.
  ///
  /// Example usage:
  /// ```dart
  /// final date1 = DateTime(2020, 1, 1);
  /// final date2 = DateTime(2020, 1, 1, 12, 0, 0);
  /// print(date1.isSameDayOrBefore(date2)); // true
  /// ```
  bool isSameDayOrBefore(DateTime other) => isBefore(other) || isSameDay(other);

  /// Checks if the date is the first day of the month.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 1);
  /// print(date.isFirstDayOfMonth); // true
  /// ```
  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth);

  /// Checks if the date is the last day of the month.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 31);
  /// print(date.isLastDayOfMonth); // true
  /// ```
  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth);

  /// Returns the first day of the month for the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 15);
  /// final firstDay = date.firstDayOfMonth;
  /// print(firstDay); // 2020-01-01 00:00:00.000
  /// ```
  DateTime get firstDayOfMonth => DateTime(year, month);

  /// Returns the last day of the month for the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 1, 15);
  /// final lastDay = date.lastDayOfMonth;
  /// print(lastDay); // 2020-01-31 00:00:00.000
  /// ```
  DateTime get lastDayOfMonth {
    final beginningNextMonth = (month < 12) ? DateTime(year, month + 1) : DateTime(year + 1);
    return beginningNextMonth.subtract(const Duration(days: 1));
  }

  /// Returns the previous month for the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 2, 15);
  /// final previousMonth = date.previousMonth;
  /// print(previousMonth); // 2020-01-15 00:00:00.000
  /// ```
  DateTime get previousMonth {
    var year = this.year;
    var month = this.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// Returns the next month for the current DateTime instance.
  ///
  /// Example usage:
  /// ```dart
  /// final date = DateTime(2020, 11, 15);
  /// final nextMonth = date.nextMonth;
  /// print(nextMonth); // 2020-12-15 00:00:00.000
  /// ```
  DateTime get nextMonth {
    var year = this.year;
    var month = this.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// Checks if two DateTime instances are in the same month and year.
  ///
  /// Example usage:
  /// ```dart
  /// final date1 = DateTime(2020, 1, 1);
  /// final date2 = DateTime(2020, 1, 15);
  /// print(date1.isSameMonth(date2)); // true
  /// ```
  bool isSameMonth(DateTime other) => other.year == year && other.month == month;

  /// Checks if two DateTime instances are in the same week.
  ///
  /// [startsWithMonday] determines which day starts the week:
  /// - `true` - Week starts on Monday (ISO 8601 standard, default)
  /// - `false` - Week starts on Sunday
  ///
  /// Example usage:
  /// ```dart
  /// final date1 = DateTime(2020, 1, 1);
  /// final date2 = DateTime(2020, 1, 5);
  /// print(date1.isSameWeek(date2)); // true (Monday start)
  /// print(date1.isSameWeek(date2, startsWithMonday: false)); // check with Sunday start
  /// ```
  bool isSameWeek(DateTime b, {bool startsWithMonday = true}) {
    final a = DateTime.utc(year, month, day);
    final adjustedB = DateTime.utc(b.year, b.month, b.day);

    final diff = a.difference(adjustedB).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    final aBeforeB = a.isBefore(adjustedB);
    final min = aBeforeB ? a : adjustedB;
    final max = aBeforeB ? adjustedB : a;

    if (startsWithMonday) {
      return min.weekday <= max.weekday;
    } else {
      final minWeekday = min.weekday % 7;
      final maxWeekday = max.weekday % 7;
      return minWeekday <= maxWeekday;
    }
  }
}
