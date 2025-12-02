extension Duplicates<T> on Iterable<T> {
  /// Returns a new iterable with [values] appended to the end of this iterable,
  /// avoiding duplicates.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Iterable<int> list1 = [1, 2, 3];
  ///   List<int> list2 = [3, 4, 5];
  ///   List<int> combined = list1.addAllByAvoidingDuplicates(list2).toList();
  ///   print(combined); // Output: [1, 2, 3, 4, 5]
  /// }
  /// ```
  Iterable<T> addAllByAvoidingDuplicates(Iterable<T> values) sync* {
    final uniqueValues = values.toSet();

    for (final item in this) {
      if (!uniqueValues.contains(item)) {
        yield item;
      }
    }

    yield* uniqueValues;
  }

  /// Returns the number of duplicate elements in the iterable.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> duplicates = [1, 2, 2, 3, 3, 3];
  ///   int count = duplicates.numberOfDuplicates;
  ///   print(count); // Output: 3
  /// }
  /// ```
  int get numberOfDuplicates => length - {...this}.length;

  /// Returns true if the iterable contains any duplicate elements.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> duplicates = [1, 2, 2, 3, 3, 3];
  ///   bool hasDuplicates = duplicates.containsDuplicates;
  ///   print(hasDuplicates); // Output: true
  /// }
  /// ```
  bool get containsDuplicates => numberOfDuplicates > 0;

  /// Returns a new iterable containing only the unique elements from this iterable.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> uniques = [1, 2, 2, 3, 3, 3];
  ///   List<int> uniqueNumbers = uniques.uniques;
  ///   print(uniqueNumbers); // Output: [1, 2, 3]
  /// }
  /// ```
  Iterable<T> get uniques => [
    ...{...this},
  ];

  /// Returns a new iterable containing only the duplicate elements from this iterable.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> duplicates = [1, 2, 2, 3, 3, 3];
  ///   List<int> duplicateNumbers = duplicates.duplicates.toList();
  ///   print(duplicateNumbers); // Output: [2, 3]
  /// }
  /// ```
  Iterable<T> get duplicates sync* {
    final seenElements = <T>{};

    for (final element in this) {
      if (!seenElements.add(element)) {
        yield element;
      }
    }
  }
}
