extension CallWhen<T> on T? Function() {
  /// Calls the function and returns its result only if the [predicate] is true.
  ///
  /// If the [predicate] is false, the function is not called and `null` is returned.
  ///
  /// Example usage:
  /// ```dart
  /// String? getValue() => "Hello, world!";
  ///
  /// void main() {
  ///   const executeFunction = true;
  ///   String? result = getValue.callWhen(predicate: executeFunction);
  ///
  ///   print(result); // Output: Hello, world!
  /// }
  /// ```
  T? callWhen({required bool predicate}) {
    if (predicate) return this();
    return null;
  }
}
