extension CompactMap<T> on List<T> {
  /// Maps each element of the list using the provided function [f] and
  /// returns a new list containing only the non-null results.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   const List<int> list = [1, 2, 3, 4, 5];
  ///
  ///   // Convert each integer to its corresponding string representation,
  ///   // and filter out any null values.
  ///   final List<String> result = list.compactMap((value) => value == 3 ? null : value.toString());
  ///
  ///   print(result); // Output: [1, 2, 4, 5]
  /// }
  /// ```
  List<E> compactMap<E>(E? Function(T element) f) {
    Iterable<E> imp(E? Function(T element) f) sync* {
      for (final value in this) {
        final mapped = f(value);
        if (mapped != null) {
          yield mapped;
        }
      }
    }

    return imp(f).toList();
  }
}
