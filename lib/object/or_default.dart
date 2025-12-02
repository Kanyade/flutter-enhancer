extension OrDefault<T> on T? {
  /// Returns a default value if the object is null.
  /// Supported types and their defaults:
  /// - int: 0
  /// - String: ''
  /// - double: 0.0
  /// - Map: {}
  /// - List: []
  /// - Set: {}
  ///
  /// For unsupported types, it will throw.
  ///
  /// Example usage:
  /// ```dart
  /// int? a;
  /// print(a.orDefault); // prints 0
  ///
  /// String? b;
  /// print(b.orDefault); // prints ''
  ///
  /// List? c;
  /// print(c.orDefault); // prints []
  /// ```
  T get orDefault {
    final value = this;
    if (value == null) {
      return {int: 0, String: '', double: 0.0, Map: {}, List: [], Set: <dynamic>{}}[T] as T;
    } else {
      return value;
    }
  }
}
