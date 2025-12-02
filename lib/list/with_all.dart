extension WhenAll<T> on List<T?> {
  /// Executes the [callback] with the list of elements
  /// if all elements in the list are non-null. If any element is null,
  /// the method returns null.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int?> numbers = [1, 2, 3];
  ///
  ///   int? sum = numbers.withAll((values) => values.reduce((a, b) => a + b));
  ///   print(sum); // Output: 6
  ///
  ///   List<String?> names = ['Alice', null, 'Bob'];
  ///
  ///   String? concatenated = names.withAll((values) => values.join(', '));
  ///   print(concatenated); // Output: null
  /// }
  /// ```
  T? whenAll(T Function(List<T>) callback) => any((e) => e == null) ? null : callback(cast<T>());
}
