extension Splice<T> on List<T> {
  /// Removes [count] elements from the list starting at index [start],
  /// and optionally inserts elements from [insert] at that position.
  /// Returns an [Iterable] of the removed elements.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3, 4, 5];
  ///
  ///   Iterable<int> removedElements = numbers.splice(1, 2);
  ///   print(numbers); // Output: [1, 4, 5]
  ///   print(removedElements); // Output: [2, 3]
  ///
  ///   List<int> newElements = [10, 11, 12];
  ///   Iterable<int> replacedElements = numbers.splice(1, 1, newElements);
  ///   print(numbers); // Output: [1, 10, 11, 12, 5]
  ///   print(replacedElements); // Output: [4]
  /// }
  /// ```
  Iterable<T> splice(int start, int count, [List<T>? insert]) {
    final result = [...getRange(start, start + count)];
    replaceRange(start, start + count, insert ?? []);
    return result;
  }
}
