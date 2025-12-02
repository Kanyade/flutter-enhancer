extension NumberUtils on num {
  /// Returns true if the number is positive (greater than zero).
  ///
  /// Example usage:
  /// ```dart
  /// final number = 5;
  /// print(number.isPositive); // true
  /// ```
  bool get isPositive => this > 0;

  /// Returns true if the number is positive or zero.
  ///
  /// Example usage:
  /// ```dart
  /// final number = 0;
  /// print(number.isPositiveOrZero); // true
  /// ```
  bool get isPositiveOrZero => this >= 0;

  /// Returns true if the number is negative (less than zero).
  ///
  /// Example usage:
  /// ```dart
  /// final number = -5;
  /// print(number.isNegative); // true
  /// ```
  bool get isNegative => this < 0;

  /// Returns true if the number is negative or zero.
  ///
  /// Example usage:
  /// ```dart
  /// final number = 0;
  /// print(number.isNegativeOrZero); // true
  /// ```
  bool get isNegativeOrZero => this <= 0;

  /// Returns true if the number is zero.
  ///
  /// Example usage:
  /// ```dart
  /// final number = 0;
  /// print(number.isZero); // true
  /// ```
  bool get isZero => this == 0;

  /// Returns true if the number is an integer.
  ///
  /// Example usage:
  /// ```dart
  /// final number = 5.0;
  /// print(number.isInteger); // true
  /// ```
  bool get isInteger => this == toInt();

  /// Returns true if the number is a double.
  ///
  /// Example usage:
  /// ```dart
  /// final number = 5.5;
  /// print(number.isDouble); // true
  /// ```
  bool get isDouble => this == toDouble();
}
