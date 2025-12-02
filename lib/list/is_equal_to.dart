import 'package:collection/collection.dart';

extension Equality<T> on List<T> {
  /// Returns true if this list is equal to [other] when order of elements
  /// does not matter.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> list1 = [1, 2, 3];
  ///   List<int> list2 = [3, 2, 1];
  ///   bool areEqual = list1.isEqualToUnordered(list2);
  ///   print(areEqual); // Output: true
  /// }
  /// ```
  bool isEqualToUnordered(List<T> other) => const DeepCollectionEquality.unordered().equals(this, other);

  /// Returns true if this list is equal to [other] when order of elements
  /// matters.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<String> list1 = ['apple', 'banana', 'orange'];
  ///   List<String> list2 = ['apple', 'banana', 'orange'];
  ///   bool areEqual = list1.isEqualTo(list2);
  ///   print(areEqual); // Output: true
  /// }
  /// ```
  bool isEqualTo(List<T> other) => const DeepCollectionEquality().equals(this, other);
}
