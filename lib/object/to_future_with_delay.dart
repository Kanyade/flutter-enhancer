extension WithDelay<T> on T {
  /// Converts the object to a Future that completes with the object after an optional delay.
  ///
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   final value = 42;
  ///   final futureValue = value.toFuture(Duration(seconds: 1));
  ///   print(await futureValue); // Prints 42 after 1 second delay
  /// }
  /// ```
  Future<T> toFuture([Duration? delay]) => delay != null ? Future.delayed(delay, () => this) : Future.value(this);
}
