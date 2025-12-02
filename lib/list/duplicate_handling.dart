extension DuplicatesList<T> on List<T> {
  /// Adds all elements from [values] to this list, avoiding duplicates.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3];
  ///   numbers.addAllByAvoidingDuplicates([3, 4, 5]);
  ///   print(numbers); // Output: [1, 2, 3, 4, 5]
  /// }
  /// ```
  void addAllByAvoidingDuplicates(Iterable<T> values) => replaceRange(0, length, {
    ...[...this] + [...values],
  });

  /// Returns the number of duplicate elements in the iterable.
  /// Note that this does not count the unique elements that are duplicated, but the total number of duplicates.
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
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> duplicates = [1, 2, 2, 3, 3, 3];
  ///   bool hasDuplicates = duplicates.containsDuplicates;
  ///   print(hasDuplicates); // Output: true
  /// }
  /// ```
  bool get containsDuplicates => numberOfDuplicates > 0;

  /// Returns a new list containing only the unique elements from this list.
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> uniques = [1, 2, 2, 3, 3, 3];
  ///   List<int> uniqueNumbers = uniques.uniques;
  ///   print(uniqueNumbers); // Output: [1, 2, 3]
  /// }
  /// ```
  List<T> get uniques => [
    ...{...this},
  ];

  /// Removes duplicate elements from the list in place.
  /// 
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<String> names = ['Alice', 'Bob', 'Alice'];
  ///   names.removeDuplicates();
  ///   print(names); // Output: [Alice, Bob]
  /// }
  /// ```
  void removeDuplicates() => replaceRange(0, length, uniques);

  /// Returns a new list containing only the duplicate elements from this list.
  /// Note that if an element is duplicated multiple times, it will appear multiple times in the result.
  /// 
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> duplicates = [1, 2, 2, 3, 3, 3];
  ///   List<int> duplicateNumbers = duplicates.duplicates;
  ///   print(duplicateNumbers); // Output: [2, 3, 3]
  /// }
  /// ```
  List<T> get duplicates => [
    for (var i = 0; i < length; i++) [...this].skip(i + 1).contains(this[i]) ? this[i] : null,
  ].whereType<T>().toList();
}
