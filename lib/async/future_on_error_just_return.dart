import 'dart:async';

extension OnError<T> on Future<T> {
  /// Returns a Future that completes with the provided [value] if the original
  /// Future completes with an error, ignoring the error.
  ///
  /// Example usage:
  /// ```dart
  /// import 'dart:async';
  ///
  /// Future<int> fetchData() async {
  ///   // Simulating an asynchronous operation that may throw an error
  ///   await Future.delayed(const Duration(seconds: 2));
  ///   throw Exception('Error occurred during data fetching');
  /// }
  ///
  /// void main() async {
  ///   Future<int> result = fetchData().onErrorJustReturn(0);
  ///
  ///   final val = await result;
  ///   print(val); //prints 0
  /// }
  /// ```
  Future<T> onErrorJustReturn(T value) => catchError((_) => value);
}

extension OnErrorNullable<T> on Future<T?> {
  /// Returns a Future that completes with null if the original
  /// Future completes with an error, ignoring the error.
  ///
  /// Note that this only works for Futures that return nullable types.
  ///
  /// Example usage:
  /// ```dart
  /// import 'dart:async';
  ///
  /// Future<int?> fetchData() async {
  ///   // Simulating an asynchronous operation that may throw an error
  ///   await Future.delayed(const Duration(seconds: 2));
  ///   throw Exception('Error occurred during data fetching');
  /// }
  ///
  /// void main() async {
  ///   Future<int?> result = fetchData().drainErrorsNullable();
  ///
  ///   final val = await result;
  ///   print(val == null); //prints true
  /// }
  /// ```
  Future<T?> drainErrorsNullable() => catchError((_) => null);

  /// Returns a Future that completes with null if the original
  /// Future completes with an error, ignoring the error.
  ///
  /// This is similar to [drainErrorsNullable], but works for all Future types,
  /// not just those that return nullable types.
  ///
  /// Example usage:
  /// ```dart
  /// import 'dart:async';
  ///
  /// Future<int> fetchData() async {
  ///   // Simulating an asynchronous operation that may throw an error
  ///   await Future.delayed(const Duration(seconds: 2));
  ///   throw Exception('Error occurred during data fetching');
  /// }
  ///
  /// void main() async {
  ///   Future<int?> result = fetchData().drainErrorsAll();
  ///
  ///   final val = await result;
  ///   print(val == null); //prints true
  /// }
  /// ```
  Future<T?> drainErrorsAll() {
    final completer = Completer<T?>();

    unawaited(then(completer.complete, onError: (_) => completer.complete(null)));

    return completer.future;
  }
}
