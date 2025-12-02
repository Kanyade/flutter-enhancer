import 'dart:async';

extension BufferedStreamExtension<T> on Stream<T> {
  /// Buffers events emitted by the stream until the first listener is added.
  /// 
  /// This is useful when you want to ensure that no events are missed
  /// before any listener starts listening to the stream. Once the first
  /// listener is added, all buffered events are emitted to that listener,
  /// and subsequent events are emitted directly to all listeners.
  /// 
  /// It does not retain events when there are active listeners.
  /// 
  /// Example usage:
  /// ```dart
  /// final sourceStream = Stream.periodic(Duration(seconds: 1), (count) => count).take(8);
  /// final bufferedStream = sourceStream.bufferedStreamUntilFirstListener;
  /// 
  /// // No listener yet, events are being buffered.
  /// 
  /// Future.delayed(Duration(seconds: 3), () {
  ///   // First listener added after 3 seconds.
  ///   bufferedStream.listen((event) {
  ///     print('Listener 1 received: $event');
  ///   });
  /// });
  /// 
  /// Future.delayed(Duration(seconds: 5), () {
  ///   // Second listener added after 5 seconds.
  ///   bufferedStream.listen((event) {
  ///     print('Listener 2 received: $event');
  ///   });
  /// });
  /// ```
  Stream<T> get bufferedStreamUntilFirstListener {
    final buffer = <T>[];

    StreamController<T>? controller;
    bool firstListenerAdded = false;

    controller = StreamController<T>.broadcast(
      onListen: () {
        firstListenerAdded = true;
        buffer
          ..forEach(controller!.add)
          ..clear();
      },
      onCancel: () {
        firstListenerAdded = false;
      },
    );

    listen(
      (event) {
        if (!firstListenerAdded) {
          buffer.add(event);
        } else {
          controller!.add(event);
        }
      },
      onError: (e, s) => controller!.addError(e, s),
      onDone: controller.close,
    );

    return controller.stream;
  }
}
