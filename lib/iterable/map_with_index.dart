extension IterationWithIndex<T> on Iterable<T> {
  /// Maps each element of the iterable along with its index using the provided
  /// function [f].
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   const List<String> fruits = ['Apple', 'Banana', 'Orange', 'Mango'];
  ///
  ///   final indexedFruits = fruits.mapWithIndex((index, fruit) => '$index: $fruit').toList();
  ///
  ///   indexedFruits.forEach(print);
  /// }
  /// ```
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) =>
      Iterable.generate(length).map((i) => f(i, elementAt(i)));
}
