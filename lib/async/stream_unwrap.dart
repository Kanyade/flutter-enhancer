extension UnwrapStream<T> on Stream<T?> {
  /// Unwraps nullable events from the stream, emitting only non-null values.
  /// 
  /// This is useful when you have a stream of nullable values and want to
  /// filter out the nulls, only receiving the non-null values.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final nullableValues = Stream<int?>.fromIterable([1, null, 2, null, 3]);
  ///
  ///   final unwrappedValues = nullableValues.unwrap();
  ///
  ///   unwrappedValues.listen((data) {
  ///       print('Received: $data');
  ///   });
  /// }
  /// ```
  Stream<T> unwrap() => where((event) => event != null).cast();
}
