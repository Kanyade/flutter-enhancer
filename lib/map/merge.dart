extension Merge<K, V> on Map<K, V> {
  /// Merges the current map with another map.
  /// If there are duplicate keys, the values from the [other] map will overwrite those in the current map.
  /// If [other] is null, the current map is returned unchanged.
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
  ///   Map<String, int> mergedMap = map1.merge(map2);
  ///   print(mergedMap); // Output: {a: 1, b: 3, c: 4}
  /// }
  /// ```
  Map<K, V> merge(Map<K, V>? other) => {...this}..addEntries(other?.entries ?? {});
}

extension MergeNested on Map<String, dynamic> {
  /// Merges the current map with another map recursively.
  /// If there are duplicate keys and both values are maps, they are merged recursively.
  /// Otherwise, the values from the [other] map will overwrite those in the current map.
  /// If [other] is null, the current map is returned unchanged.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final Map<String, dynamic> map1 = {
  ///     'a': 1,
  ///     'b': {'c': 2, 'd': 3},
  ///     'e': 4,
  ///   };
  ///   final Map<String, dynamic> map2 = {
  ///     'b': {'c': 3, 'd': 4},
  ///     'f': 5,
  ///   };
  ///   final Map<String, dynamic> mergedMap = map1.mergeNested(map2);
  ///   print(mergedMap); // Output: {a: 1, b: {c: 3, d: 4}, e: 4, f: 5}
  /// }
  /// ```
  Map<String, dynamic> mergeNested(Map<String, dynamic> other) {
    final result = Map<String, dynamic>.from(this);
    other.forEach((key, otherValue) {
      if (result.containsKey(key)) {
        final thisValue = result[key];
        if (thisValue is Map<String, dynamic> && otherValue is Map<String, dynamic>) {
          result[key] = thisValue.mergeNested(otherValue);
        } else if (otherValue != null) {
          result[key] = otherValue;
        }
      } else {
        result[key] = otherValue;
      }
    });
    return result;
  }

  /// Merges the current map with another map recursively, handling numerical instructions.
  /// If there are duplicate keys and both values are maps, they are merged recursively.
  /// If a value in the [other] map is a [NumericalAddition] and the corresponding value in the current map is a number,
  /// the addition is performed and the value will be a number.
  /// Otherwise, the values from the [other] map will overwrite those in the current map.
  /// If [other] is null, the current map is returned unchanged.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final Map<String, dynamic> map1 = {
  ///     'a': 1,
  ///     'b': {'c': 2, 'd': 3},
  ///     'f': 4,
  ///   };
  ///   final Map<String, dynamic> map2 = {
  ///     'b': {'c': 3, 'd': 4},
  ///     'f': const NumericalAddition(5),
  ///   };
  ///   final Map<String, dynamic> mergedMap = map1.mergeNestedWithAdditions(map2);
  ///   print(mergedMap); // Output: {a: 1, b: {c: 3, d: 4}, f: 9}
  /// }
  /// ```
  Map<String, dynamic> mergeNestedWithAdditions(Map<String, dynamic> other) {
    final result = Map<String, dynamic>.from(this);
    other.forEach((key, otherValue) {
      if (result.containsKey(key)) {
        final thisValue = result[key];
        if (thisValue is Map<String, dynamic> && otherValue is Map<String, dynamic>) {
          result[key] = thisValue.mergeNestedWithAdditions(otherValue);
        } else if (thisValue is num && otherValue is NumericalAddition) {
          result[key] = thisValue + otherValue.amount;
        } else if (otherValue != null) {
          if (otherValue is NumericalAddition) {
            result[key] = otherValue.amount;
          } else if (otherValue is Map<String, dynamic>) {
            result[key] = <String, dynamic>{}.mergeNestedWithAdditions(otherValue);
          } else {
            result[key] = otherValue;
          }
        }
      } else {
        if (otherValue is NumericalAddition) {
          result[key] = otherValue.amount;
        } else if (otherValue is Map<String, dynamic>) {
          result[key] = <String, dynamic>{}.mergeNestedWithAdditions(otherValue);
        } else {
          result[key] = otherValue;
        }
      }
    });
    return result;
  }
}

/// A class representing a numerical addition instruction.
/// Used in [mergeNestedWithAdditions] to indicate that a value should be added to an existing numerical value.
class NumericalAddition {
  const NumericalAddition(this.amount);

  final num amount;
}
