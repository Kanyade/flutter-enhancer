extension MergeList<T> on List<T> {
  /// Merges this list with [items] and returns a new list.
  /// If [unique] is true, elements already present will not be added again from
  /// [items]. Note that if the original list has duplicates, they will be preserved.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3, 4];
  ///   List<int> newNumbers = [3, 4, 5, 6, 7];
  ///
  ///   List<int> mergedList = numbers.merge(newNumbers);
  ///   print(mergedList); // Output: [1, 2, 3, 4, 3, 4, 5, 6, 7]
  ///
  ///   List<int> uniqueMergedList = numbers.merge(newNumbers, unique: true);
  ///   print(uniqueMergedList); // Output: [1, 2, 3, 4, 5, 6, 7]
  /// }
  /// ```
  List<T> merge(List<T> items, {bool unique = false}) {
    final list = <T>[].followedBy(this).toList();
    if (unique) {
      for (final item in items) {
        if (!list.contains(item)) list.add(item);
      }
      return list;
    } else {
      return list.followedBy(items).toList();
    }
  }
}
