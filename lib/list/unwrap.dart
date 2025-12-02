extension UnwrapList<T> on List<T?>? {
  /// Unwraps a nullable list of nullable items into a non-nullable list of non-nullable items.
  /// If the original list is null, it returns an empty list.
  /// If the original list contains null items, they are filtered out.
  ///
  /// Example usage:
  /// ```dart
  /// List<int?>? nullableList = [1, 2, null, 4];
  /// List<int> unwrappedList = nullableList.unwrap(); // [1, 2, 4]
  /// ```
  List<T> unwrap() => (this ?? []).whereType<T>().toList();
}
