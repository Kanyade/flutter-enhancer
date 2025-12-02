extension InlineAdd<T> on Iterable<T> {
  /// Returns a new iterable with [other] appended to the end of this iterable.
  /// 
  /// Example usage:
  /// ```dart
  /// final Iterable<int> numbers = [1, 2, 3];
  /// final newNumbers = numbers + 4;
  /// print(newNumbers); // Output: (1, 2, 3, 4)
  /// ```
  Iterable<T> operator +(T other) => followedBy([other]);
}
