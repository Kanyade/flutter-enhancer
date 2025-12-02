extension MapToList<T> on Iterable<T> {
  /// Maps each element of the iterable to a new form using the provided
  /// [toElement] function and returns the results as a list.
  /// 
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   List<int> numbers = [1, 2, 3, 4, 5];
  ///   List<String> numberStrings = numbers.mapList((number) => number.toString());
  ///
  ///   print(numberStrings); // Output: [1, 2, 3, 4, 5]
  /// }
  /// ```
  List<E> mapList<E>(E Function(T element) toElement) => map(toElement).toList();
}
