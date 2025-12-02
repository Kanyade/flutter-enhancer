extension MinMax<T extends num> on List<T> {
  /// Returns the minimum value in the list.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [5, 3, 8, 1, 4];
  ///   print(numbers.min); // Output: 1
  /// }
  /// ```
  T get min => _sorted.first;

  /// Returns the maximum value in the list.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [5, 3, 8, 1, 4];
  ///   print(numbers.max); // Output: 8
  /// }
  /// ```
  T get max => _sorted.last;

  List<T> get _sorted => [...this]..sort();
}
