import 'dart:async';

import 'package:flutter_enhancer/flutter_enhancer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WithTimeoutBetweenEvents', () {
    test('adds timeout error when time between events exceeds duration', () async {
      final controller = StreamController<int>();
      const duration = Duration(milliseconds: 100);
      final timedStream = controller.stream.withTimeoutBetweenEvents(duration);

      final receivedData = <int>[];
      final receivedErrors = <Object>[];

      timedStream.listen(
        receivedData.add,
        onError: (error) => receivedErrors.add(error),
      );

      controller.add(1);
      await Future.delayed(const Duration(milliseconds: 50));

      controller.add(2);
      await Future.delayed(const Duration(milliseconds: 150));

      await controller.close();

      expect(receivedData, [1, 2]);
      expect(receivedErrors.length, greaterThan(0));
      expect(receivedErrors.first, isA<TimeoutBetweenEventsException>());
    });

    test('does not timeout when events arrive within duration', () async {
      final controller = StreamController<int>();
      const duration = Duration(milliseconds: 100);
      final timedStream = controller.stream.withTimeoutBetweenEvents(duration);

      final receivedData = <int>[];
      final receivedErrors = <Object>[];

      timedStream.listen(
        receivedData.add,
        onError: (error) => receivedErrors.add(error),
      );

      controller.add(1);
      await Future.delayed(const Duration(milliseconds: 50));

      controller.add(2);
      await Future.delayed(const Duration(milliseconds: 50));

      controller.add(3);
      await Future.delayed(const Duration(milliseconds: 50));

      await controller.close();

      expect(receivedData, [1, 2, 3]);
      expect(receivedErrors, isEmpty);
    });

    test('resets timeout on each event', () async {
      final controller = StreamController<int>();
      const duration = Duration(milliseconds: 100);
      final timedStream = controller.stream.withTimeoutBetweenEvents(duration);

      final receivedData = <int>[];
      final receivedErrors = <Object>[];

      timedStream.listen(
        receivedData.add,
        onError: (error) => receivedErrors.add(error),
      );

      controller.add(1);
      await Future.delayed(const Duration(milliseconds: 80));

      controller.add(2);
      await Future.delayed(const Duration(milliseconds: 80));

      controller.add(3);
      await Future.delayed(const Duration(milliseconds: 80));

      await controller.close();

      expect(receivedData, [1, 2, 3]);
      expect(receivedErrors, isEmpty);
    });

    test('handles first event correctly', () async {
      final controller = StreamController<int>();
      const duration = Duration(milliseconds: 50);
      final timedStream = controller.stream.withTimeoutBetweenEvents(duration);

      final receivedData = <int>[];
      final receivedErrors = <Object>[];

      timedStream.listen(
        receivedData.add,
        onError: (error) => receivedErrors.add(error),
      );

      controller.add(1);
      await Future.delayed(const Duration(milliseconds: 100));

      await controller.close();

      expect(receivedData, [1]);
      expect(receivedErrors.length, greaterThan(0));
    });

    test('completes stream correctly', () async {
      final controller = StreamController<int>();
      const duration = Duration(milliseconds: 100);
      final timedStream = controller.stream.withTimeoutBetweenEvents(duration);

      final events = <int>[];

      timedStream.listen(
        events.add,
        onDone: () {},
      );

      controller
        ..add(0)
        ..add(1)
        ..add(2);
      await controller.close();

      await Future.delayed(const Duration(milliseconds: 50));

      expect(events.isNotEmpty, true);
    });

    test('can be cancelled', () async {
      final controller = StreamController<int>();
      const duration = Duration(milliseconds: 100);
      final timedStream = controller.stream.withTimeoutBetweenEvents(duration);

      final receivedData = <int>[];

      final subscription = timedStream.listen(receivedData.add);

      controller.add(1);
      await Future.delayed(const Duration(milliseconds: 50));

      await subscription.cancel();

      controller.add(2);
      await Future.delayed(const Duration(milliseconds: 50));

      await controller.close();

      expect(receivedData, [1]);
    });
  });
}
