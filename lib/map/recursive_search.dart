// ignore_for_file: no_leading_underscores_for_local_identifiers

extension RecursiveSearchByDataType<K extends Comparable, V> on Map<K, V> {
  /// Recursively searches the map and its nested maps for entries where the value is of type T.
  /// Returns an iterable of MapEntry&lt;K, T&gt; for all matching entries.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Map<String, dynamic> data = {
  ///     'name': 'John',
  ///     'age': 30,
  ///     'address': {
  ///       'street': '123 Main St',
  ///       'city': 'New York',
  ///       'zip': 10001,
  ///      },
  ///     'contact': {'email': 'john@example.com', 'phone': '555-1234'},
  ///   };
  ///
  ///   Iterable<MapEntry<String, String>> stringValues = data.search<String>();
  ///   print(stringValues.toList()); // Output: [(name, John), (street, 123 Main St), (city, New York), (email, john@example.com), (phone, 555-1234)]
  ///
  ///   Iterable<MapEntry<String, int>> integerValues = data.search<int>();
  ///   print(integerValues.toList()); // Output: [(age, 30), (zip, 10001)]
  /// }
  /// ```
  Iterable<MapEntry<K, T>> search<T>() sync* {
    Iterable<MapEntry<K, T>> _search(MapEntry entry) sync* {
      if (entry.value is T) {
        yield MapEntry(entry.key as K, entry.value as T);
      } else if (entry.value is Map) {
        for (final nestedEntry in (entry.value as Map).entries) {
          yield* _search(nestedEntry);
        }
      }
    }

    for (final entry in entries) {
      yield* _search(entry);
    }
  }
}
