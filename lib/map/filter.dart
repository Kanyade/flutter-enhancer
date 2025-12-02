extension Filter<K, V> on Map<K, V> {
  /// Filters the map entries based on the provided predicate function [f].
  /// The function returns an iterable of map entries that satisfy the condition defined in [f].
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
  ///   Iterable<MapEntry<String, int>> highScores = scores.filter((entry) => entry.value > 80);
  ///   print(highScores); // Output: (Alice: 90), (Eve: 85)
  ///
  ///   Iterable<MapEntry<String, int>> namesStartingWithB = scores.filter((entry) => entry.key.startsWith('B'));
  ///   print(namesStartingWithB); // Output: (Bob: 75)
  /// }
  /// ```
  Iterable<MapEntry<K, V>> filter(bool Function(MapEntry<K, V> entry) f) sync* {
    for (final entry in entries) {
      if (f(entry)) {
        yield entry;
      }
    }
  }
}
