import 'dart:async';

/// A StreamTransformer that adds a timeout between events.
/// If the time between two consecutive events exceeds the specified [duration],
/// a [TimeoutBetweenEventsException] will be added to the stream.
class TimeoutBetweenEvents<E> extends StreamTransformerBase<E, E> {
  const TimeoutBetweenEvents({required this.duration});
  final Duration duration;

  @override
  Stream<E> bind(Stream<E> stream) {
    StreamController<E>? controller;
    StreamSubscription? subscription;
    Timer? timer;

    controller = StreamController(
      onListen: () {
        subscription = stream.listen(
          (data) {
            timer?.cancel();
            timer = Timer.periodic(duration, (_) {
              controller?.addError(const TimeoutBetweenEventsException());
            });
            controller?.add(data);
          },
          onError: controller?.addError,
          onDone: controller?.close,
        );
      },
      onCancel: () => Future.delayed(Duration.zero, () async {
        await subscription?.cancel();
        timer?.cancel();
        await controller?.close();
      }),
    );

    return controller.stream;
  }
}

/// Exception thrown when a timeout occurs between events in the stream.
class TimeoutBetweenEventsException implements Exception {
  const TimeoutBetweenEventsException();
}

extension WithTimeoutBetweenEvents<T> on Stream<T> {
  /// Adds a timeout between events of the stream.
  /// If the time between two consecutive events exceeds the specified [duration],
  /// a [TimeoutBetweenEventsException] will be added to the stream.
  ///
  /// Example usage:
  /// ```dart
  /// void main() {
  ///   final stream = Stream<int>.periodic(const Duration(seconds: 2), (i) => i);
  ///
  ///   const duration = Duration(seconds: 1);
  ///   final timedStream = stream.withTimeoutBetweenEvents(duration);
  ///
  ///   timedStream.listen(
  ///     (data) {
  ///         print('Received: $data');
  ///     },
  ///     onError: (error) {
  ///         if (error is TimeoutBetweenEventsException) {
  ///             print('Timeout occurred between events');
  ///         }
  ///     },
  ///   );
  /// }
  /// ```
  Stream<T> withTimeoutBetweenEvents(Duration duration) => transform(TimeoutBetweenEvents(duration: duration));
}
