extension TakeFor<T> on Stream<T> {
  /// Takes events from the stream for the specified [duration].
  /// The returned stream will emit events from the original stream
  /// until the specified duration has elapsed since the subscription started.
  /// 
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final stream = Stream<int>.periodic(const Duration(seconds: 1), (i) => i);
  ///
  ///   const duration = Duration(seconds: 5, milliseconds: 500);
  ///   final limitedStream = stream.takeFor(duration);
  ///
  ///   limitedStream.listen((data) {
  ///     print('Received: $data');
  ///   });
  /// }
  /// ```
  Stream<T> takeFor(Duration duration) {
    final upTo = DateTime.now().add(duration);
    return takeWhile((_) {
      final now = DateTime.now();
      return now.isBefore(upTo) | now.isAtSameMomentAs(upTo);
    });
  }
}
