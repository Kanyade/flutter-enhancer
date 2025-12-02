import 'dart:async';

extension UnwrapFuture<T> on Future<T?> {
  /// Unwraps a Future that may contain a null value by providing an alternative value.
  /// If the original Future resolves to a non-null value, that value is returned.
  /// If it resolves to null, the provided alternative value is returned instead.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   Future<int?> nullableValue = fetchDataFromServer();
  ///
  ///   nullableValue.unwrapWith(2).then((value) {
  ///     print("Received value: $value");
  ///   }).catchError((error) {
  ///     print("Error occurred: $error");
  ///   });
  ///}
  ///
  ///Future<int?> fetchDataFromServer() async {
  ///  await Future.delayed(const Duration(seconds: 2));
  ///  return null;
  ///}
  /// ```
  Future<T> unwrapWith(T alternative) => then(
    (value) => value != null ? Future<T>.value(value) : Future<T>.value(alternative),
  );
}
