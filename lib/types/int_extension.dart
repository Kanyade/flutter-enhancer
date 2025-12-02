extension IntExtension on int {
  /// Converts the integer to a Duration object representing that many milliseconds.
  ///
  /// Example usage:
  /// ```dart
  /// int durationInMillis = 500;
  /// Duration duration = durationInMillis.millis;
  /// ```
  Duration get millis => Duration(milliseconds: this);

  /// Converts the integer to a Duration object representing that many seconds.
  ///
  /// Example usage:
  /// ```dart
  /// int durationInSeconds = 5;
  /// Duration duration = durationInSeconds.seconds;
  /// ```
  Duration get seconds => Duration(seconds: this);

  /// Converts the integer to a Duration object representing that many minutes.
  ///
  /// Example usage:
  /// ```dart
  /// int durationInMinutes = 10;
  /// Duration duration = durationInMinutes.minutes;
  /// ```
  Duration get minutes => Duration(minutes: this);

  /// Converts the integer to a Duration object representing that many hours.
  ///
  /// Example usage:
  /// ```dart
  /// int durationInHours = 2;
  /// Duration duration = durationInHours.hours;
  /// ```
  Duration get hours => Duration(hours: this);

  /// Converts the integer to a Duration object representing that many days.
  ///
  /// Example usage:
  /// ```dart
  /// int durationInDays = 1;
  /// Duration duration = durationInDays.days;
  /// ```
  Duration get days => Duration(days: this);

  /// Generates an iterable range of integers from this integer to [other].
  ///
  /// If [inclusive] is true, the range includes [other]; otherwise, it excludes [other].
  ///
  /// Example usage:
  /// ```dart
  /// int start = 3;
  /// int end = 7;
  /// Iterable<int> range = start.rangeTo(end, inclusive: true); // [3, 4, 5, 6, 7]
  /// ```
  Iterable<int> rangeTo(int other, {bool inclusive = true}) => other > this
      ? [for (int i = this; i < other; i++) i, if (inclusive) other]
      : [for (int i = this; i > other; i--) i, if (inclusive) other];
}
