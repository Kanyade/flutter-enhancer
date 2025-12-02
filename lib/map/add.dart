extension AddOperator<K, V> on Map<K, V> {
  /// Adds all key-value pairs from [other] to the current map and returns a new map.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Map<String, int> map1 = {
  ///     'a': 1,
  ///     'b': 2,
  ///   };
  ///
  ///   Map<String, int> map2 = {
  ///     'b': 3,
  ///     'c': 4,
  ///   };
  ///
  ///   Map<String, int> combinedMap = map1 + map2;
  ///   print(combinedMap); // Output: {a: 1, b: 3, c: 4}
  /// }
  /// ```
  Map<K, V> operator +(Map<K, V> other) => {...this}..addAll(other);
}
