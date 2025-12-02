extension DetailedWhere<K, V> on Map<K, V> {
  /// Filters the map by its keys and values using the provided predicate function.
  /// The function `f` takes a key and a value as parameters and returns a boolean indicating
  /// whether the key-value pair should be included in the resulting map.
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
  ///   Map<String, int> filteredMap = scores.where((key, value) => value >= 80);
  ///   print(filteredMap); // Output: {John: 80, Alice: 90, Eve: 85}
  /// }
  /// ```
  Map<K, V> where(bool Function(K key, V value) f) => Map<K, V>.fromEntries(
    entries.where((entry) => f(entry.key, entry.value)),
  );

  /// Filters the map by its keys using the provided predicate function.
  /// The function `f` takes a key as a parameter and returns a boolean indicating
  /// whether the key should be included in the resulting map.
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
  ///   Map<String, int> filteredByKey = scores.whereKey((key) => key.length == 3);
  ///   print(filteredByKey); // Output: {Bob: 75, Eve: 85}
  /// }
  /// ```
  Map<K, V> whereKey(bool Function(K key) f) => {...where((key, value) => f(key))};

  /// Filters the map by its values using the provided predicate function.
  /// The function `f` takes a value as a parameter and returns a boolean indicating
  /// whether the value should be included in the resulting map.
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
  ///   Map<String, int> filteredByValue = scores.whereValue((value) => value > 80);
  ///   print(filteredByValue); // Output: {Alice: 90, Eve: 85}
  /// }
  /// ```
  Map<K, V> whereValue(bool Function(V value) f) => {...where((key, value) => f(value))};
}
