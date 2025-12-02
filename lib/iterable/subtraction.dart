extension InlineRemove<E> on Iterable<E> {
  /// Returns a new iterable with elements from [other] removed from this iterable.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final numbers = [1, 2, 3, 4, 5];
  ///   final newNumbers = numbers.withoutIterable([2, 4]);
  ///   print(newNumbers); // Output: (1, 3, 5)
  /// }
  /// ```
  Iterable<E> withoutIterable(Iterable<E> other) => where((e) => !other.contains(e));

  /// Returns a new iterable with [other] removed from this iterable.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final numbers = [1, 2, 3, 4, 5];
  ///   final newNumbers = numbers.without(3);
  ///   print(newNumbers); // Output: (1, 2, 4, 5)
  /// }
  /// ```
  Iterable<E> without(E other) => where((e) => other != e);

  /// Returns a new iterable with [other] removed from this iterable.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final numbers = [1, 2, 3, 4, 5];
  ///   final newNumbers = numbers - 3;
  ///   print(newNumbers); // Output: (1, 2, 4, 5)
  /// }
  /// ```
  Iterable<E> operator -(E other) => where((e) => other != e);
}
