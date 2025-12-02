extension MapIfOfType<T> on T? {
  /// If the object is of type [E], applies the function [f] to it and returns the result.
  /// Otherwise, returns null.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Object? value = 'Hello';
  ///
  ///   String? uppercased = value.mapIfOfType<String, String>((stringValue) {
  ///     return stringValue.toUpperCase();
  ///   });
  ///
  ///   print(uppercased); // Output: HELLO
  /// }
  /// ```
  R? mapIfOfType<E, R>(R Function(E) f) {
    final self = this;
    if (self is E) {
      return f(self);
    } else {
      return null;
    }
  }
}
