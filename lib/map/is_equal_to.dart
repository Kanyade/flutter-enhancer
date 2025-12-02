import 'package:collection/collection.dart';

extension UnorderedEquality<K, V> on Map<K, V> {
  /// Checks if two maps are equal regardless of the order of their entries.
  /// This method uses deep collection equality to compare the maps.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Map<String, int> map1 = {
  ///     'a': 1,
  ///     'b': 2,
  ///     'c': 3,
  ///   };
  ///
  ///   Map<String, int> map2 = {
  ///     'b': 2,
  ///     'c': 3,
  ///     'a': 1,
  ///   };
  ///
  ///   Map<String, int> map3 = {
  ///     'a': 1,
  ///     'b': 2,
  ///     'c': 4,
  ///   };
  ///
  ///   bool isSame = map1.isEqualTo(map2);
  ///   print(isSame); // Output: true
  ///
  ///   bool isDifferent = map1.isEqualTo(map3);
  ///   print(isDifferent); // Output: false
  /// }
  /// ```
  bool isEqualTo(Map<K, V> other) => const DeepCollectionEquality.unordered().equals(this, other);
}
