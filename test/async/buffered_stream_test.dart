import 'dart:async';

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BufferedStreamExtension', () {
    test('buffers events until first listener is added', () async {
      final sourceStream = Stream.periodic(
        const Duration(milliseconds: 100),
        (count) => count,
      ).take(8);
      final bufferedStream = sourceStream.bufferedStreamUntilFirstListener;

      // Wait for some events to be emitted before listening
      await Future.delayed(const Duration(milliseconds: 350));

      final receivedEvents = <int>[];

      // First listener added after 350ms (should have buffered ~3 events)
      bufferedStream.listen(receivedEvents.add);

      await Future.delayed(const Duration(milliseconds: 600));

      // Should receive buffered events plus new ones
      expect(receivedEvents.length, greaterThan(3));
      expect(receivedEvents.first, 0);
    });

    test('broadcasts to multiple listeners after first one', () async {
      final sourceStream = Stream.periodic(
        const Duration(milliseconds: 100),
        (count) => count,
      ).take(5);
      final bufferedStream = sourceStream.bufferedStreamUntilFirstListener;

      final listener1Events = <int>[];
      final listener2Events = <int>[];

      // First listener
      bufferedStream.listen(listener1Events.add);

      await Future.delayed(const Duration(milliseconds: 250));

      // Second listener added later
      bufferedStream.listen(listener2Events.add);

      await Future.delayed(const Duration(milliseconds: 400));

      // Both listeners should receive events, but listener2 won't get buffered ones
      expect(listener1Events.isNotEmpty, true);
      expect(listener2Events.isNotEmpty, true);
      expect(listener1Events.length, greaterThan(listener2Events.length));
    });

    test('handles errors correctly', () async {
      final controller = StreamController<int>();
      final bufferedStream = controller.stream.bufferedStreamUntilFirstListener;

      final receivedEvents = <int>[];
      final receivedErrors = <Object>[];

      bufferedStream.listen(
        receivedEvents.add,
        onError: (error) => receivedErrors.add(error),
      );

      controller
        ..add(1)
        ..add(2)
        ..addError('Test error')
        ..add(3);

      await Future.delayed(const Duration(milliseconds: 100));

      expect(receivedEvents, [1, 2, 3]);
      expect(receivedErrors, ['Test error']);

      await controller.close();
    });

    test('completes when source stream completes', () async {
      final sourceStream = Stream.fromIterable([1, 2, 3]);
      final bufferedStream = sourceStream.bufferedStreamUntilFirstListener;

      var completed = false;

      bufferedStream.listen(
        (_) {},
        onDone: () => completed = true,
      );

      await Future.delayed(const Duration(milliseconds: 100));

      expect(completed, true);
    });
  });
}
