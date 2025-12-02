extension FlatMap<T> on T? {
  /// Transforms the object using the provided function if it is not null,
  /// otherwise returns null.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   const String name = 'John';
  ///
  ///   final String? capitalized = name.flatMap((value) => value.toUpperCase());
  ///
  ///   print(capitalized); // Output: JOHN
  /// }
  /// ```
  E? flatMap<E>(E? Function(T object) f) => this != null ? f(this as T) : null;
}
