extension ReduceExtension<T extends num> on List<T> {
  /// Returns the sum of all elements in the list.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3, 4, 5];
  ///   print(numbers.sum); // Output: 15
  /// }
  /// ```
  T get sum => reduce(_plus);

  /// Returns the result of subtracting all elements in the list from the first element.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [10, 2, 3];
  ///   print(numbers.subtractOthersFromFirst); // Output: 5
  /// }
  /// ```
  T get subtractOthersFromFirst => reduce(_plus);

  /// Returns the product of all elements in the list.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3, 4];
  ///   print(numbers.multiplied); // Output: 24
  /// }
  /// ```
  T get multiplied => reduce(_multiply);

  /// Returns the result of dividing the first element by all subsequent elements in the list.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [100, 2, 5];
  ///   print(numbers.divided); // Output: 10
  /// }
  /// ```
  T get divided => reduce(_divide);
}

T _plus<T extends num>(T lhs, T rhs) => (lhs + rhs) as T;
T _multiply<T extends num>(T lhs, T rhs) => (lhs * rhs) as T;
T _divide<T extends num>(T lhs, T rhs) {
  if (lhs is int && rhs is int) {
    return (lhs ~/ rhs) as T;
  } else {
    return (lhs / rhs) as T;
  }
}
