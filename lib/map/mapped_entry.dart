extension DetailedMap<K, V> on Map<K, V> {
  /// Maps the keys of the map using the provided function [f].
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Map<String, int> scores = {
  ///     'John': 80,
  ///     'Alice': 90,
  ///     'Bob': 75,
  ///     'Eve': 85,
  ///   };
  ///
  ///   Map<String, int> uppercaseKeys = scores.mappedKeys((key) => key.toUpperCase());
  ///   print(uppercaseKeys); // Output: {JOHN: 80, ALICE: 90, BOB: 75, EVE: 85}
  /// }
  /// ```
  Map<R, V> mappedKeys<R>(R Function(K key) f) => map((key, value) => MapEntry(f(key), value));

  /// Maps the values of the map using the provided function [f].
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Map<String, int> scores = {
  ///     'John': 80,
  ///     'Alice': 90,
  ///     'Bob': 75,
  ///     'Eve': 85,
  ///   };
  ///
  ///   Map<String, int> squaredValues = scores.mappedValues((value) => value * value);
  ///   print(squaredValues); // Output: {John: 6400, Alice: 8100, Bob: 5625, Eve: 7225}
  /// }
  /// ```
  Map<K, R> mappedValues<R>(R Function(V value) f) => map((key, value) => MapEntry(key, f(value)));
}
