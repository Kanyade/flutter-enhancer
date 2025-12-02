// ignore_for_file: no_leading_underscores_for_local_identifiers

extension Flatten<T extends Object?> on Iterable<T> {
  /// Flattens a nested iterable structure into a single iterable.
  /// 
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<dynamic> nestedList = [1, [2, [3, 4], 5], 6, [7, [8]]];
  ///   Iterable<dynamic> flattenedList = nestedList.flatten();
  ///
  ///   print(flattenedList); // Output: (1, 2, 3, 4, 5, 6, 7, 8)
  /// }
  /// ```
  Iterable<T> flatten({bool retainNulls = false}) {
    Iterable<T> _flatten(Iterable<T> list) sync* {
      for (final value in list) {
        if (value is List<T>) {
          yield* _flatten(value);
        } else if (value != null || retainNulls) {
          yield value;
        }
      }
    }

    return _flatten(this);
  }
}
