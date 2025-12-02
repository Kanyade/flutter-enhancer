import 'dart:async';

/// A StreamTransformer that absorbs errors, optionally emits a value, and then finishes the stream.
/// If an error occurs, the [onError] callback is invoked to provide an optional value to emit
/// before closing the stream.
class ErrorAbsorberTransformer<T> extends StreamTransformerBase<T, T> {
  ErrorAbsorberTransformer({this.onError});
  final _controller = StreamController<T>.broadcast();
  final T? Function(Object error)? onError;

  @override
  Stream<T> bind(Stream<T> stream) {
    final sub = stream
        .handleError((error) {
          if (onError != null) {
            final value = onError!(error);
            if (value != null) {
              _controller.sink.add(value);
            }
          }
          unawaited(_controller.close());
        })
        .listen(
          _controller.sink.add,
          onDone: _controller.close,
        );
    _controller.onCancel = sub.cancel;
    return _controller.stream;
  }
}

extension OnErrorFinishWith<T> on Stream<T> {
  /// Cancels subscription after first error and optionally emits a value.
  /// The error is absorbed and not forwarded to listeners but you can log
  /// it or handle it in the [onError] callback.
  ///
  /// Example usage:
  /// ```dart
  /// Stream<int> generateStreamWithError() async* {
  ///   yield 1;
  ///   yield 2;
  ///   yield 3;
  ///
  ///   throw Exception('Custom error');
  ///}

  /// void main() {
  ///   generateStreamWithError().onErrorFinishWith((_) => 99).listen(
  ///     (value) {
  ///         print('Received: $value');
  ///     },
  ///     onDone: () {
  ///         print('Stream completed');
  ///     },
  ///   );
  ///}
  /// ```
  Stream<T> onErrorFinishWith([T? Function(Object error)? onError]) => transform(
    ErrorAbsorberTransformer<T>(onError: onError),
  );
}
